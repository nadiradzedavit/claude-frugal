#!/usr/bin/env bash

#############################################
# Claude-Frugal Installation Script
# Installs efficiency skills for Claude Code
#############################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Emojis
CHECK="✅"
ROCKET="🚀"
WRENCH="🔧"
WARN="⚠️"
INFO="ℹ️"
FIRE="🔥"

echo ""
echo "${BLUE}════════════════════════════════════════${NC}"
echo "${BLUE}   Claude-Frugal Installer v1.0.0${NC}"
echo "${BLUE}   Token Efficiency Toolkit${NC}"
echo "${BLUE}════════════════════════════════════════${NC}"
echo ""

# Function to print status messages
print_status() {
    echo -e "${GREEN}${CHECK}${NC} $1"
}

print_info() {
    echo -e "${BLUE}${INFO}${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}${WARN}${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if running from correct directory
if [ ! -d ".claude/skills" ]; then
    print_error "Error: .claude/skills directory not found!"
    echo ""
    echo "Please run this script from the claude-frugal repository root:"
    echo "  cd claude-frugal"
    echo "  bash install.sh"
    echo ""
    exit 1
fi

# Define target directory
SKILLS_DIR="${HOME}/.claude/skills"

print_info "Installing Claude-Frugal skills to: ${SKILLS_DIR}"
echo ""

# Check if target directory exists, create if not
if [ ! -d "${SKILLS_DIR}" ]; then
    print_info "Creating skills directory..."
    mkdir -p "${SKILLS_DIR}"
    print_status "Created ${SKILLS_DIR}"
else
    print_status "Skills directory exists"
fi

# Count skills to install
SKILL_COUNT=$(find .claude/skills -name "*.md" | wc -l)
print_info "Found ${SKILL_COUNT} skills to install"
echo ""

# Copy skills with progress
echo "${WRENCH} Installing skills..."
for skill_file in .claude/skills/*.md; do
    if [ -f "$skill_file" ]; then
        skill_name=$(basename "$skill_file")

        # Check if skill already exists
        if [ -f "${SKILLS_DIR}/${skill_name}" ]; then
            print_warn "Updating existing skill: ${skill_name}"
        else
            print_status "Installing: ${skill_name}"
        fi

        # Copy the skill
        cp "$skill_file" "${SKILLS_DIR}/"
    fi
done

echo ""

# Set correct permissions
print_info "Setting permissions..."
chmod 644 "${SKILLS_DIR}"/*.md
print_status "Permissions set (644)"

echo ""

# Verify installation
echo "${WRENCH} Verifying installation..."
INSTALLED_COUNT=$(find "${SKILLS_DIR}" -name "distill.md" -o -name "slim-read.md" -o -name "limit-watch.md" | wc -l)

if [ "$INSTALLED_COUNT" -eq 3 ]; then
    print_status "All skills installed successfully!"
else
    print_error "Installation incomplete. Expected 3 skills, found ${INSTALLED_COUNT}"
    exit 1
fi

echo ""
echo "${GREEN}════════════════════════════════════════${NC}"
echo "${GREEN}${FIRE} Installation Complete! ${FIRE}${NC}"
echo "${GREEN}════════════════════════════════════════${NC}"
echo ""
echo "Installed skills:"
echo "  ${CHECK} /distill      - Compress conversations (99% token reduction)"
echo "  ${CHECK} /slim-read    - Precision file reading (90% token savings)"
echo "  ${CHECK} /limit-watch  - Real-time budget monitoring"
echo ""
echo "${ROCKET} Quick Start:"
echo ""
echo "  1. Open Claude Code in your project:"
echo "     ${BLUE}claude${NC}"
echo ""
echo "  2. Check your token budget:"
echo "     ${BLUE}/limit-watch${NC}"
echo ""
echo "  3. Read files efficiently:"
echo "     ${BLUE}/slim-read your-file.py function_name${NC}"
echo ""
echo "  4. When yellow zone appears (30K+ tokens):"
echo "     ${BLUE}/distill${NC}"
echo "     ${BLUE}/compact${NC}"
echo ""
echo "${INFO} Documentation: https://github.com/yourusername/claude-frugal"
echo "${INFO} Need help? Open an issue on GitHub"
echo ""
echo "${GREEN}Happy coding! ${ROCKET}${NC}"
echo ""
