# Technical Reference

Claude Frugal currently exposes three Claude Code skills and one helper script.

## Skill Package Layout

```text
.claude/skills/
  slim-read/
    SKILL.md
    scripts/slim_read.py
  distill/
    SKILL.md
  limit-watch/
    SKILL.md
```

The installer copies these directories to `~/.claude/skills/`.

## Skills

| Skill | Invocation | Behavior |
| --- | --- | --- |
| `slim-read` | "Use slim-read to inspect auth.py" | Lists structure or extracts a focused target before full file reads |
| `distill` | "Run distill before I compact" | Produces a compact handoff summary for `/compact` |
| `limit-watch` | "Check whether this context is getting large" | Gives a rough context-size estimate and next action |

Skills are model-invoked through natural language. They are not custom slash
commands. `/compact` remains a built-in Claude Code command.

## slim-read Helper

```bash
python3 ~/.claude/skills/slim-read/scripts/slim_read.py <file>
python3 ~/.claude/skills/slim-read/scripts/slim_read.py <file> --target <symbol-or-range>
```

Supported targets:

- `50-100` line ranges
- Python `def`, `async def`, and `class`
- JavaScript/TypeScript `function`, `class`, `export function`,
  `export class`, and simple `const name =`
- Markdown headings in structure output

Exit codes:

- `0`: success
- `1`: target was not found
- `2`: file path error

## Installer Behavior

`install.sh` supports two modes:

- local clone: copies `.claude/skills/*` from the repo
- one-line install: downloads the skill package from GitHub raw URLs

The installer is idempotent. Existing skill directories are updated in place.
Legacy flat files like `~/.claude/skills/slim-read.md` are not removed
automatically; the installer warns if they exist.

## Validation

Run:

```bash
npm test
```

The test suite validates the skill package layout, installer smoke behavior,
`slim-read` extraction, and token calculator output shape.
