---
name: distill
description: Summarize the current session into a compact handoff before using /compact.
---

# Distill

Use this skill when the conversation is getting long, the user is near a natural
breakpoint, or the user asks to preserve decisions before clearing context.

## Workflow

1. Review the recent conversation and tool work.
2. Extract only durable information:
   - user goal and current state,
   - decisions made,
   - files changed or inspected,
   - commands already run and notable results,
   - unresolved risks or next steps.
3. Write a compact handoff summary in the response.
4. If project memory is available and appropriate, save or update the memory
   entry following the current Claude Code memory conventions for the project.
5. Tell the user they can run `/compact` after verifying the summary.

## Output Style

Use short sections:

```text
Distilled handoff
- Goal:
- Decisions:
- Files:
- Verified:
- Next:
```

Do not claim exact token savings unless measured data is available.
