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
echo -e "${BLUE}════════════════════════════════════════${NC}"
echo -e "${BLUE}   Claude-Frugal Installer v1.0.0${NC}"
echo -e "${BLUE}   Token Efficiency Toolkit${NC}"
echo -e "${BLUE}════════════════════════════════════════${NC}"
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
echo -e "${WRENCH} Installing skills..."
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
echo -e "${WRENCH} Verifying installation..."
INSTALLED_COUNT=$(find "${SKILLS_DIR}" -name "distill.md" -o -name "slim-read.md" -o -name "limit-watch.md" | wc -l)

if [ "$INSTALLED_COUNT" -eq 3 ]; then
    print_status "All skills installed successfully!"
else
    print_error "Installation incomplete. Expected 3 skills, found ${INSTALLED_COUNT}"
    exit 1
fi

echo ""
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}${FIRE} Installation Complete! ${FIRE}${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo ""
echo "Installed skills:"
echo "  ${CHECK} distill      - Compress conversations (99% token reduction)"
echo "  ${CHECK} slim-read    - Precision file reading (90% token savings)"
echo "  ${CHECK} limit-watch  - Real-time budget monitoring"
echo ""
echo -e "${YELLOW}═══════════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}📌 IMPORTANT: How to Use These Skills${NC}"
echo -e "${YELLOW}═══════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}Claude Code skills are NOT slash commands.${NC}"
echo "They're triggered by natural language requests."
echo ""
echo -e "${GREEN}${ROCKET} How to Use:${NC}"
echo ""
echo "  1. Open Claude Code in your project:"
echo -e "     ${BLUE}claude${NC}"
echo ""
echo "  2. Ask Claude naturally to check your token budget:"
echo -e "     ${BLUE}\"Check my token usage with limit-watch\"${NC}"
echo -e "     ${BLUE}\"How many tokens have I used?\"${NC}"
echo ""
echo "  3. Request precision file reading:"
echo -e "     ${BLUE}\"Use slim-read to show me the authenticate function in auth.py\"${NC}"
echo -e "     ${BLUE}\"Read just the UserModel class from models.py\"${NC}"
echo ""
echo "  4. When you hit yellow zone (30K+ tokens):"
echo -e "     ${BLUE}\"Run distill to compress this conversation\"${NC}"
echo -e "     ${BLUE}\"Compress our chat history into memory\"${NC}"
echo ""
echo "  5. After distilling, clear context:"
echo -e "     ${BLUE}\"/compact\"${NC} ${YELLOW}(this IS a built-in command)${NC}"
echo ""
echo -e "${YELLOW}═══════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${INFO} Documentation: https://github.com/yourusername/claude-frugal"
echo -e "${INFO} Need help? Open an issue on GitHub"
echo ""
echo -e "${GREEN}Happy coding! ${ROCKET}${NC}"
echo ""
