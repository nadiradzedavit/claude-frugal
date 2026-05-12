# Video Outline

Target length: 45 to 90 seconds.

## Message

Claude Frugal is an experimental Claude Code skills package. It is looking for
beta testers, not claiming proven savings yet.

## Shots

1. Install:

   ```bash
   bash install.sh
   ```

2. Verify skill layout:

   ```bash
   find ~/.claude/skills/slim-read -maxdepth 2 -type f
   ```

3. Run the helper:

   ```bash
   python3 ~/.claude/skills/slim-read/scripts/slim_read.py demo/token-calculator.py --target TokenCalculator
   ```

4. Show model output:

   ```bash
   python3 demo/token-calculator.py --all
   ```

5. End with a beta tester request.

## Avoid

- Do not say savings are proven.
- Do not promise exact message multipliers.
- Do not show fake slash commands for the skills.
