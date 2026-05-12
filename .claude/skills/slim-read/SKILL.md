---
name: slim-read
description: Inspect file structure or extract one symbol/range before reading a whole file into context.
---

# Slim Read

Use this skill when the user wants to inspect a specific function, class, export,
heading, or line range from a file. The goal is to avoid loading an entire large
file when a focused excerpt is enough.

## Workflow

1. Prefer the bundled helper before using a full file read:

   ```bash
   python3 "$HOME/.claude/skills/slim-read/scripts/slim_read.py" path/to/file
   python3 "$HOME/.claude/skills/slim-read/scripts/slim_read.py" path/to/file --target SymbolName
   python3 "$HOME/.claude/skills/slim-read/scripts/slim_read.py" path/to/file --target 50-100
   ```

2. If the helper path is not available, use the project-local copy:

   ```bash
   python3 .claude/skills/slim-read/scripts/slim_read.py path/to/file --target SymbolName
   ```

3. Show the focused result with the source path and line numbers.

4. If no target is provided, show a structure menu and ask which symbol or range
   to inspect next.

5. Fall back to reading the full file only when:
   - the file is small,
   - the helper cannot parse the requested target,
   - the task requires whole-file context,
   - or cross-function behavior matters.

## Supported Targets

- Line ranges: `50-100`
- Python: `def`, `async def`, `class`
- JavaScript/TypeScript: `function`, `class`, `export function`,
  `export class`, and simple `const name =` declarations
- Markdown: headings as structure entries

## Output Style

Keep the response compact:

```text
path/to/file:42-78
[focused excerpt]
```

If the target was not found, say that and show the nearest available structure
entries instead of guessing.
