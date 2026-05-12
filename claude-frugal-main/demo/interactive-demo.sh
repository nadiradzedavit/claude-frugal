#!/usr/bin/env bash

set -euo pipefail

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

HELPER=".claude/skills/slim-read/scripts/slim_read.py"

pause() {
    printf '\nPress Enter to continue...'
    read -r
}

header() {
    printf '\n%s%s%s\n' "$BLUE" "$1" "$NC"
    printf '%s\n\n' "------------------------------------------------------------"
}

demo_overview() {
    header "Claude Frugal beta workflow"
    cat <<'TEXT'
Claude Frugal installs three Claude Code skills:

- slim-read: inspect structure or one target before reading a whole file
- distill: write a compact handoff before /compact
- limit-watch: estimate whether context is getting large

The calculator in this repo is theoretical. Treat its numbers as a model until
real beta reports validate them.
TEXT
}

demo_slim_read() {
    header "slim-read helper"

    if [ ! -f "$HELPER" ]; then
        printf '%sHelper not found:%s %s\n' "$YELLOW" "$NC" "$HELPER"
        printf 'Run this demo from the repository root.\n'
        return
    fi

    printf '%sStructure listing:%s\n' "$GREEN" "$NC"
    python3 "$HELPER" demo/token-calculator.py | sed -n '1,12p'

    printf '\n%sFocused target:%s\n' "$GREEN" "$NC"
    python3 "$HELPER" demo/token-calculator.py --target TokenCalculator | sed -n '1,18p'
}

demo_distill() {
    header "distill prompt pattern"
    cat <<'TEXT'
Prompt Claude Code:

  Run distill before I compact this session.

Expected output shape:

  Distilled handoff
  - Goal:
  - Decisions:
  - Files:
  - Verified:
  - Next:

After checking the handoff, run the built-in Claude Code command:

  /compact
TEXT
}

demo_limit_watch() {
    header "limit-watch prompt pattern"
    cat <<'TEXT'
Prompt Claude Code:

  Check whether this context is getting large.

Expected output shape:

  Context estimate: Green, Yellow, or Red
  Why: short explanation
  Next: keep working, use slim-read, distill, or compact

This is an estimate, not exact billing or rate-limit data.
TEXT
}

demo_calculator() {
    header "theoretical token calculator"
    python3 demo/token-calculator.py --all
    printf '%sNote:%s this is model output, not validated real-world evidence.\n' "$YELLOW" "$NC"
}

show_menu() {
    clear
    printf '%sClaude Frugal Interactive Demo%s\n\n' "$BLUE" "$NC"
    printf '1) Overview\n'
    printf '2) slim-read helper\n'
    printf '3) distill pattern\n'
    printf '4) limit-watch pattern\n'
    printf '5) token calculator\n'
    printf '0) Exit\n\n'
    printf 'Choice: '
}

while true; do
    show_menu
    read -r choice

    case "$choice" in
        1) demo_overview ;;
        2) demo_slim_read ;;
        3) demo_distill ;;
        4) demo_limit_watch ;;
        5) demo_calculator ;;
        0) exit 0 ;;
        *) printf 'Invalid choice.\n' ;;
    esac

    pause
done
