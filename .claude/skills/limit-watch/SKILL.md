---
name: limit-watch
description: Estimate current context usage and suggest when to distill or compact.
---

# Limit Watch

Use this skill when the user asks about token budget, context size, or whether
they should compact. Claude Code does not expose an exact universal token meter
to this skill, so report estimates clearly.

## Workflow

1. Estimate the current context from visible conversation, tool output, file
   excerpts, and code blocks.
2. Classify the session:
   - Green: small context, keep working normally.
   - Yellow: context is growing, finish the current task and consider distill.
   - Red: context is large, distill before starting unrelated work.
3. Recommend the next action:
   - keep working,
   - use `slim-read` for targeted file inspection,
   - run `distill`,
   - or run `/compact` after a handoff is saved.

## Output Style

Keep the report concise:

```text
Context estimate: Yellow
Why: several large file/tool outputs are now in context.
Next: finish the current edit, run distill, then /compact.
```

Avoid presenting estimated numbers as exact billing or rate-limit data.
