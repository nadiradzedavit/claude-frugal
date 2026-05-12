# Examples

These examples show intended workflows. They are not benchmark results.

## Targeted File Inspection

```text
User: Use slim-read to inspect demo/token-calculator.py
Claude: Runs the slim-read helper and shows available classes/functions.

User: Show just the TokenCalculator class.
Claude: Extracts only that class with line numbers.
```

## Compact Handoff

```text
User: Run distill before I compact.
Claude: Summarizes the goal, decisions, changed files, commands run, and next steps.

User: /compact
Claude Code: Clears the conversation context.
```

## Context Check

```text
User: Check whether this context is getting large.
Claude: Reports a rough Green/Yellow/Red estimate and suggests the next action.
```

## Good Beta Report

```markdown
Workflow: Python debugging
Skills used: slim-read 6 times, distill 1 time
What helped: avoided loading large modules repeatedly
What failed: helper missed one nested function
Quality impact: no obvious degradation
Measured data: none
```
