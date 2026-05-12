# Demo Guide

Use this when recording a short beta demo.

## Flow

1. Show the repo root and explain that this is an experimental Claude Code skills package.
2. Run `bash install.sh`.
3. Verify `~/.claude/skills/slim-read/SKILL.md` exists.
4. Run:

   ```bash
   python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py
   python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py --target TokenCalculator
   ```

5. Show `python3 demo/token-calculator.py --all`.
6. State clearly that the calculator is theoretical and beta reports are needed.

## Short Script

"Claude Frugal is a beta set of Claude Code skills for reducing context waste.
The useful part today is slim-read: it can inspect a large file and extract one
symbol before Claude reads the whole thing. The calculator shows the model, but
real savings still need validation."
