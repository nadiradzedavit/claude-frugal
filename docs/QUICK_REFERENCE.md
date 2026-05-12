# Quick Reference

## Install

```bash
bash install.sh
```

## Verify

```bash
ls ~/.claude/skills/slim-read/SKILL.md
ls ~/.claude/skills/distill/SKILL.md
ls ~/.claude/skills/limit-watch/SKILL.md
```

## Skill Prompts

Use natural language:

```text
Use slim-read to inspect src/auth.py
Use slim-read to show just validate_token from src/auth.py
Use slim-read to show lines 50-100 of src/auth.py
Run distill before I compact this session
Check whether this context is getting large
```

`/compact` is a Claude Code built-in command. The Claude Frugal skills are not
custom slash commands.

## Helper Script

```bash
python3 ~/.claude/skills/slim-read/scripts/slim_read.py src/auth.py
python3 ~/.claude/skills/slim-read/scripts/slim_read.py src/auth.py --target validate_token
python3 ~/.claude/skills/slim-read/scripts/slim_read.py src/auth.py --target 50-100
```
