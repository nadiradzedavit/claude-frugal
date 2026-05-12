# Testing and Validation

Claude Frugal is a beta project. The calculator models possible context savings,
but the project needs real Claude Code session reports before publishing strong
performance claims.

## Current Evidence

| Area | Status |
| --- | --- |
| Skill package layout | Tested by CI |
| Installer smoke test | Tested by CI with temporary `HOME` |
| `slim-read` helper | Tested by CI for structure, symbol, and range extraction |
| Token calculator | Mathematical model only |
| Real-world savings | Needs beta reports |

## Run Local Checks

```bash
npm test
bash -n install.sh
python3 demo/token-calculator.py --all
python3 .claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py --target TokenCalculator
```

## Beta Test Protocol

1. Install the skills.
2. Pick one real coding task.
3. Start with `limit-watch` to get a rough context baseline.
4. Use `slim-read` before asking Claude to inspect large files.
5. Use `distill` at a natural breakpoint, then run `/compact`.
6. Record what helped, what failed, and whether quality changed.

## Data to Report

Please include:

- Claude Code version and OS.
- Task type and project language.
- Approximate session length.
- How often you used each skill.
- Whether `slim-read` avoided full-file reads.
- Whether `distill` preserved enough context after `/compact`.
- Any measured token data, if available.
- Subjective quality impact.

## Test Report Template

```markdown
## Beta Report

Claude Code version:
OS:
Workflow:
Project language:

### Session
- Task:
- Duration:
- Messages:
- Skills used:

### Results
- What helped:
- What was confusing:
- Did quality change:
- Any measured token data:

### Recommendation
- Keep as-is:
- Needs changes:
```

## Validation Policy

- Treat calculator output as theoretical.
- Do not describe modeled percentages as proven savings.
- Update public claims only after real reports support them.
- Keep negative reports. They are useful product data.
