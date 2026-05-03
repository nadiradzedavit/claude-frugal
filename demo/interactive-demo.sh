#!/bin/bash
#
# Claude-Frugal Interactive Demo
# Simulates the efficiency workflow with real-time visualization
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Config
DELAY=0.5
TYPING_DELAY=0.03

# Utility functions
type_text() {
    text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $TYPING_DELAY
    done
    echo
}

print_header() {
    echo -e "\n${CYAN}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║  $1${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    sleep $DELAY
}

print_section() {
    echo -e "\n${BLUE}▶ $1${NC}"
    sleep $DELAY
}

print_user() {
    echo -e "${GREEN}You:${NC} $1"
    sleep $DELAY
}

print_claude() {
    echo -e "${PURPLE}Claude:${NC} $1"
    sleep $DELAY
}

print_system() {
    echo -e "${YELLOW}⚙️  System:${NC} $1"
    sleep $DELAY
}

show_token_bar() {
    usage=$1
    limit=$2
    percentage=$((usage * 100 / limit))

    if [ $percentage -lt 60 ]; then
        color=$GREEN
        zone="Green Zone"
    elif [ $percentage -lt 80 ]; then
        color=$YELLOW
        zone="Yellow Zone"
    else
        color=$RED
        zone="Red Zone"
    fi

    filled=$((percentage / 5))
    empty=$((20 - filled))
    bar=$(printf "${color}█%.0s${NC}" $(seq 1 $filled))
    bar+=$(printf "░%.0s" $(seq 1 $empty))

    echo -e "\n  Token Usage: [${bar}] ${usage:0:2}K/${limit}K"
    echo -e "  Status: ${color}● $zone${NC}"
    echo -e "  Efficiency: $(((limit - usage) * 100 / limit))% capacity remaining\n"
    sleep $DELAY
}

show_savings() {
    saved=$1
    echo -e "\n  ${GREEN}✓ Token Savings:${NC}"
    echo -e "    • Saved: ${GREEN}${saved} tokens${NC}"
    echo -e "    • Efficiency gain: ${GREEN}~${2}%${NC}"
    echo -e "    • Additional messages possible: ${GREEN}+${3}${NC}\n"
    sleep $DELAY
}

# Demo scenarios
demo_full_workflow() {
    clear
    print_header "Claude-Frugal: Complete Efficiency Workflow Demo"

    echo -e "${CYAN}This demo simulates a real development session showing:"
    echo -e "  • Token budget monitoring"
    echo -e "  • Precision file reading"
    echo -e "  • Context distillation"
    echo -e "  • 5x capacity extension"
    echo -e "\nPress Enter to begin...${NC}"
    read -r

    # Session start
    clear
    print_section "Starting New Development Session"
    print_user "I need to build a REST API with authentication"
    print_system "Claude Code session initialized"
    show_token_bar 0 50

    # Initial work
    print_section "Phase 1: Initial Setup & Planning"
    print_user "Check my token usage to establish baseline"
    print_claude "📊 Token Budget Status:"
    show_token_bar 3 50

    print_user "Let's start by reading the auth.py file"
    print_system "Standard read would use: ~2,000 tokens"
    sleep 1
    print_user "Actually, use slim-read to show me just the structure"
    print_claude "Using precision reading instead..."
    print_claude "📄 auth.py structure:"
    echo -e "    • validate_token() - line 45"
    echo -e "    • refresh_session() - line 89  "
    echo -e "    • hash_password() - line 120"
    show_savings 1850 92 7
    show_token_bar 5 50

    # Development work
    print_section "Phase 2: Active Development (20 messages)"
    for i in {1..3}; do
        echo -e "${GREEN}You:${NC} Implementing feature $i..."
        echo -e "${PURPLE}Claude:${NC} [Code generation, testing, debugging]"
        sleep 0.3
    done
    print_system "Using slim-read for 5 more files..."
    show_savings 8500 89 34
    show_token_bar 18 50

    # More work
    print_section "Phase 3: Extended Work (25 more messages)"
    for i in {1..3}; do
        echo -e "${GREEN}You:${NC} Adding validation and error handling..."
        echo -e "${PURPLE}Claude:${NC} [Implementation continues]"
        sleep 0.3
    done
    show_token_bar 31 50
    print_claude "🟡 Approaching Yellow Zone - Consider distilling soon"

    # Distillation
    print_section "Phase 4: Intelligent Compression"
    print_user "Run distill to compress this conversation"
    print_claude "Analyzing last 50 messages for key insights..."
    sleep 1
    print_claude "✓ Extracted 8 decision points"
    print_claude "✓ Saved 3 architectural patterns"
    print_claude "✓ Preserved 2 user preferences"
    print_claude "\nCompressed 31,000 tokens → 500 tokens"
    show_savings 30500 99 122
    print_claude "💡 Ready to reclaim context. Run: ${CYAN}/compact${NC}"

    print_user "/compact"
    print_system "Context cleared. Memory preserved."
    show_token_bar 2 50

    # Continue working
    print_section "Phase 5: Continued Development (Fresh Context)"
    print_claude "All previous decisions remembered via memory system"
    print_user "Let's add the payment integration"
    print_claude "I remember we're using JWT auth with Redis caching..."
    show_token_bar 5 50

    # Summary
    print_header "Session Summary"
    echo -e "${GREEN}✓ Completed:${NC}"
    echo -e "  • REST API with authentication"
    echo -e "  • Payment integration started"
    echo -e "  • ~80 productive messages"
    echo -e "  • No rate limits hit\n"

    echo -e "${CYAN}Token Usage Comparison:${NC}"
    echo -e "  Standard workflow:  ${RED}65,000 tokens${NC} → Rate limited @ message 40"
    echo -e "  Frugal workflow:    ${GREEN}12,000 tokens${NC} → Still going strong\n"

    echo -e "${YELLOW}Capacity Extension:${NC}"
    echo -e "  Effective multiplier: ${GREEN}5.4x${NC}"
    echo -e "  Additional work possible: ${GREEN}200%${NC}"
    echo -e "  Money saved (effective): ${GREEN}\$11.30/month${NC}\n"
}

demo_slim_read() {
    clear
    print_header "Slim-Read: Precision File Reading Demo"

    print_section "Scenario: Large file (auth.py, 450 lines)"

    echo -e "${RED}❌ Standard Approach:${NC}"
    print_user "Read auth.py"
    print_claude "Reading entire file..."
    print_system "Tokens used: 1,850"
    show_token_bar 18 50

    echo -e "\n${GREEN}✓ Frugal Approach:${NC}"
    print_user "Use slim-read to show me auth.py structure"
    print_claude "Scanning file structure..."
    print_claude "📄 Found 12 functions, 3 classes"
    print_system "Tokens used: 120"
    show_token_bar 1 50

    print_user "Now show me just the validate_token function"
    print_claude "Extracting validate_token (lines 45-67)..."
    echo -e "\n${CYAN}def validate_token(token: str) -> bool:"
    echo -e "    \"\"\"Validates JWT token signature and expiration.\"\"\""
    echo -e "    # [function implementation]${NC}\n"
    print_system "Tokens used: 180"
    show_savings 1670 90 7
    show_token_bar 3 50

    echo -e "\n${YELLOW}Result:${NC} 90% token reduction, same information"
}

demo_distill() {
    clear
    print_header "Distill: Intelligent Context Compression Demo"

    print_section "Scenario: Long debugging session (60 messages)"
    show_token_bar 58 50

    print_user "Run distill to compress this conversation"
    print_claude "Analyzing conversation history..."
    sleep 1

    echo -e "\n${CYAN}Extraction Results:${NC}"
    echo -e "  ${GREEN}✓${NC} Project context: JWT auth implementation"
    echo -e "  ${GREEN}✓${NC} Key decision: Using Redis for session storage"
    echo -e "  ${GREEN}✓${NC} User preference: Explicit error messages"
    echo -e "  ${GREEN}✓${NC} Bug fix: Race condition in token refresh"
    echo -e "  ${GREEN}✓${NC} Reference: Security patterns in docs/security.md"

    print_claude "\nSaved 5 memory files to ~/.claude/memory/"
    print_claude "Compressed 58,000 tokens → 450 tokens"
    show_savings 57550 99 230

    print_claude "💡 Run ${CYAN}/compact${NC} to clear history and reclaim context"

    print_user "/compact"
    show_token_bar 1 50

    echo -e "\n${GREEN}✓ Context Reset Complete${NC}"
    echo -e "  • Conversation history cleared"
    echo -e "  • All decisions preserved in memory"
    echo -e "  • Ready for 200+ more messages"
}

demo_limit_watch() {
    clear
    print_header "Limit-Watch: Real-Time Budget Monitoring Demo"

    print_section "Monitoring session progression"

    for stage in "5:Green:Optimal performance" "32:Yellow:Plan to distill soon" "55:Red:Immediate action needed"; do
        IFS=':' read -r tokens zone message <<< "$stage"
        echo -e "\n${CYAN}After ${tokens}K tokens of work:${NC}"
        print_user "Check my token usage with limit-watch"
        print_claude "📊 Token Budget Analysis:"
        show_token_bar $tokens 50
        print_claude "$message"
        sleep 1
    done

    echo -e "\n${YELLOW}Key Benefit:${NC}"
    echo -e "  • Proactive monitoring prevents wasteful context bloat"
    echo -e "  • Know when to distill before hitting limits"
    echo -e "  • Avoid surprise rate limits mid-task"
}

# Menu
show_menu() {
    clear
    echo -e "${CYAN}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║           Claude-Frugal Interactive Demo Suite                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo "Select a demo to run:"
    echo
    echo "  1) Complete Efficiency Workflow (5 minutes)"
    echo "  2) Slim-Read: Precision File Reading"
    echo "  3) Distill: Context Compression"
    echo "  4) Limit-Watch: Budget Monitoring"
    echo "  5) Run All Demos"
    echo "  0) Exit"
    echo
    echo -n "Enter choice [0-5]: "
}

# Main loop
while true; do
    show_menu
    read -r choice

    case $choice in
        1) demo_full_workflow ;;
        2) demo_slim_read ;;
        3) demo_distill ;;
        4) demo_limit_watch ;;
        5)
            demo_full_workflow
            echo -e "\nPress Enter to continue..."
            read -r
            demo_slim_read
            echo -e "\nPress Enter to continue..."
            read -r
            demo_distill
            echo -e "\nPress Enter to continue..."
            read -r
            demo_limit_watch
            ;;
        0)
            echo -e "\n${GREEN}Thanks for exploring Claude-Frugal!${NC}"
            echo -e "Get started: ${CYAN}bash install.sh${NC}\n"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice${NC}"
            sleep 1
            ;;
    esac

    echo -e "\n${CYAN}Press Enter to return to menu...${NC}"
    read -r
done
