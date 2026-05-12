# Installation Verification

## Fresh Install

```bash
bash install.sh
```

Expected files:

```text
~/.claude/skills/slim-read/SKILL.md
~/.claude/skills/slim-read/scripts/slim_read.py
~/.claude/skills/distill/SKILL.md
~/.claude/skills/limit-watch/SKILL.md
```

## Smoke Test

```bash
python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py
python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py --target TokenCalculator
```

## Temporary HOME Test

```bash
tmp_home="$(mktemp -d)"
HOME="$tmp_home" bash install.sh
find "$tmp_home/.claude/skills" -maxdepth 3 -type f
```

## Notes

Legacy flat skill files such as `~/.claude/skills/slim-read.md` are no longer
installed by this project. If they exist from an older install, remove them
manually after confirming you do not need local edits.
