# Claude Frugal

Experimental Claude Code skills for reducing context waste in long coding
sessions.

Claude Frugal installs three small skills:

- `slim-read`: inspect file structure or extract one symbol/range before loading a whole file.
- `distill`: create a compact handoff before running `/compact`.
- `limit-watch`: estimate when the current context is getting large.

> Status: beta. The repository includes a theoretical token calculator, but real
> savings are still being validated with user reports.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-beta-yellow.svg)](TESTING.md)
[![Claude Code](https://img.shields.io/badge/Claude_Code-skills-blue.svg)](https://code.claude.com/docs/en/skills)

## Install

One-line install:

```bash
curl -fsSL https://raw.githubusercontent.com/nadiradzedavit/claude-frugal/main/install.sh | bash
```

Manual install:

```bash
git clone https://github.com/nadiradzedavit/claude-frugal.git
cd claude-frugal
bash install.sh
```

Verify:

```bash
ls ~/.claude/skills/slim-read/SKILL.md
ls ~/.claude/skills/distill/SKILL.md
ls ~/.claude/skills/limit-watch/SKILL.md
```

## Use

Skills are model-invoked by Claude Code. Ask for them in normal language:

```text
Use slim-read to inspect demo/token-calculator.py
Use slim-read to show just the TokenCalculator class
Run distill before I compact this session
Check whether this context is getting large
```

`slim-read` also ships a helper script that Claude can run before reading a
large file:

```bash
python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py
python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py --target TokenCalculator
python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py --target 50-90
```

## What Is Included

| Skill | Purpose | Current state |
| --- | --- | --- |
| `slim-read` | Focus file inspection on a symbol or line range | Includes a dependency-free Python helper |
| `distill` | Preserve decisions before `/compact` | Prompt workflow only |
| `limit-watch` | Estimate context size and suggest next action | Estimated, not exact metering |

## Token Calculator

The demo calculator models possible savings for common workflows. It is useful
for discussing methodology, not as proof of guaranteed results.

```bash
python3 demo/token-calculator.py --all
```

Expected current model output:

```text
AVERAGE                                88.0%         7.9x
```

The calculator assumptions are documented in [TESTING.md](TESTING.md), and the
implementation is in [demo/token-calculator.py](demo/token-calculator.py).

## Validation Needed

Claude Frugal still needs real-world reports for:

- actual token savings from targeted file reads,
- whether distill summaries preserve enough context after `/compact`,
- whether limit-watch estimates are useful in real sessions,
- usability across macOS, Linux, and WSL.

If you test it, please open a beta report using the GitHub issue template.

## Development

Run the project checks:

```bash
npm test
```

Useful local checks:

```bash
bash -n install.sh
python3 demo/token-calculator.py --all
python3 .claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py --target TokenCalculator
```

## Docs

- [Testing and validation](TESTING.md)
- [Examples](docs/EXAMPLES.md)
- [API notes](docs/API.md)
- [Roadmap](ROADMAP.md)
- [Contributing](CONTRIBUTING.md)
- [Archived project notes](docs/archive/)
