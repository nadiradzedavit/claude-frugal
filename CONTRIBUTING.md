# Contributing

The most valuable contribution right now is beta testing with real Claude Code
sessions.

## Priority Contributions

1. Submit beta reports with real workflow notes.
2. Improve the `slim-read` helper for more languages.
3. Fix installer, CI, or documentation issues.
4. Add small, well-tested skills with clear use cases.

## Beta Testing

1. Install the project:

   ```bash
   bash install.sh
   ```

2. Use the skills in a real session:

   ```text
   Use slim-read to inspect path/to/file.py
   Run distill before I compact this session
   Check whether this context is getting large
   ```

3. Open a GitHub issue with your results. Include what worked, what failed, and
   whether the workflow changed Claude's output quality.

## Skill Format

New skills must use the Claude Code skill directory format:

```text
.claude/skills/your-skill/
  SKILL.md
  scripts/
```

Minimum `SKILL.md` frontmatter:

```markdown
---
name: your-skill
description: Short description of when Claude should use this skill.
---
```

Keep instructions specific, measurable, and honest. Do not claim exact savings
without real data.

## Pull Request Checklist

- `npm test` passes.
- Installer still works with a temporary `HOME`.
- README and docs avoid unsupported performance claims.
- Any new helper script has tests.
- Examples use natural language skill invocation, not fake slash commands.

## Development Commands

```bash
npm test
bash -n install.sh
python3 demo/token-calculator.py --all
```

## License

By contributing, you agree that your contribution is licensed under the MIT
License.
