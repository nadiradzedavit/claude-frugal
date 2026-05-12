const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const test = require('node:test');
const { execFileSync } = require('node:child_process');

const ROOT = path.resolve(__dirname, '..');
const SKILLS = ['slim-read', 'distill', 'limit-watch'];

function run(command, args, options = {}) {
  return execFileSync(command, args, {
    cwd: ROOT,
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
    ...options,
  });
}

test('skills use directory layout with SKILL.md frontmatter', () => {
  const skillRoot = path.join(ROOT, '.claude', 'skills');
  const rootEntries = fs.readdirSync(skillRoot, { withFileTypes: true });
  const flatMarkdown = rootEntries
    .filter((entry) => entry.isFile() && entry.name.endsWith('.md'))
    .map((entry) => entry.name);

  assert.deepEqual(flatMarkdown, []);

  for (const skill of SKILLS) {
    const skillPath = path.join(skillRoot, skill, 'SKILL.md');
    assert.equal(fs.existsSync(skillPath), true, `${skillPath} should exist`);

    const contents = fs.readFileSync(skillPath, 'utf8');
    assert.match(contents, /^---\n/);
    assert.match(contents, new RegExp(`\\nname: ${skill}\\n`));
    assert.match(contents, /\ndescription: .+\n/);
  }
});

test('slim-read helper lists structure and extracts focused targets', () => {
  const helper = path.join('.claude', 'skills', 'slim-read', 'scripts', 'slim_read.py');

  const structure = run('python3', [helper, 'demo/token-calculator.py']);
  assert.match(structure, /class TokenCalculator/);
  assert.match(structure, /function main/);

  const symbol = run('python3', [helper, 'demo/token-calculator.py', '--target', 'TokenCalculator']);
  assert.match(symbol, /class TokenCalculator:/);
  assert.match(symbol, /calculate_standard_usage/);

  const range = run('python3', [helper, 'demo/token-calculator.py', '--target', '1-3']);
  assert.match(range, /demo\/token-calculator.py:1-3/);
  assert.match(range, /Claude-Frugal Token Calculator/);
});

test('slim-read helper supports common JavaScript and TypeScript declarations', () => {
  const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'claude-frugal-js-'));
  const jsFile = path.join(tempDir, 'sample.ts');
  fs.writeFileSync(
    jsFile,
    [
      'export function buildThing(input: string) {',
      '  return input.trim();',
      '}',
      '',
      'export class Widget {',
      '  render() { return null; }',
      '}',
      '',
      'const localValue = 1;',
      '',
    ].join('\n'),
  );

  const helper = path.join(ROOT, '.claude', 'skills', 'slim-read', 'scripts', 'slim_read.py');
  const structure = run('python3', [helper, jsFile]);
  assert.match(structure, /function buildThing/);
  assert.match(structure, /class Widget/);
  assert.match(structure, /function localValue/);

  const symbol = run('python3', [helper, jsFile, '--target', 'Widget']);
  assert.match(symbol, /export class Widget/);
  assert.doesNotMatch(symbol, /const localValue/);
});

test('installer validates and installs skill directories into a temporary home', () => {
  run('bash', ['-n', 'install.sh']);
  run('bash', ['-n', 'demo/interactive-demo.sh']);

  const tempHome = fs.mkdtempSync(path.join(os.tmpdir(), 'claude-frugal-home-'));
  const output = run('bash', ['install.sh'], {
    env: { ...process.env, HOME: tempHome },
  });

  assert.match(output, /Installed slim-read/);

  for (const skill of SKILLS) {
    assert.equal(
      fs.existsSync(path.join(tempHome, '.claude', 'skills', skill, 'SKILL.md')),
      true,
      `${skill} should be installed`,
    );
  }

  const installedHelper = path.join(
    tempHome,
    '.claude',
    'skills',
    'slim-read',
    'scripts',
    'slim_read.py',
  );
  assert.equal(fs.existsSync(installedHelper), true);
});

test('token calculator reports bounded theoretical percentages', () => {
  const output = run('python3', ['demo/token-calculator.py', '--all']);
  assert.match(output, /AVERAGE/);

  const percentages = [...output.matchAll(/(\d+\.\d)%/g)].map((match) => Number(match[1]));
  assert.ok(percentages.length > 0);
  for (const percentage of percentages) {
    assert.ok(percentage >= 0, `${percentage} should be non-negative`);
    assert.ok(percentage <= 99.9, `${percentage} should not exceed 99.9`);
  }
});
