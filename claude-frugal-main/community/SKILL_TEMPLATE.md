# Skill Template

Create new skills as directories:

```text
.claude/skills/your-skill/
  SKILL.md
  scripts/        # optional helper scripts
```

Minimum `SKILL.md`:

```markdown
---
name: your-skill
description: Short description of when Claude should use this skill.
---

# Your Skill

Use this skill when...

## Workflow

1. First concrete action.
2. Second concrete action.
3. Output format.

## Limits

- What this skill cannot do.
- When Claude should fall back to normal workflow.
```

## Requirements

- Use natural language examples, not fake slash commands.
- Include helper scripts only when they remove real work or reduce context.
- Do not claim exact token savings without measured data.
- Add tests for any helper script.
- Keep dependencies minimal.
