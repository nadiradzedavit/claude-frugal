#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/nadiradzedavit/claude-frugal"
RAW_BASE="https://raw.githubusercontent.com/nadiradzedavit/claude-frugal/main"
TARGET_ROOT="${HOME}/.claude/skills"
EXPECTED_SKILLS=("slim-read" "distill" "limit-watch")
TEMP_DIR=""

info() {
    printf '[info] %s\n' "$1" >&2
}

ok() {
    printf '[ok] %s\n' "$1"
}

warn() {
    printf '[warn] %s\n' "$1" >&2
}

fail() {
    printf '[error] %s\n' "$1" >&2
    exit 1
}

cleanup() {
    if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}
trap cleanup EXIT

download_file() {
    url="$1"
    output="$2"

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$url" -o "$output"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO "$output" "$url"
    else
        fail "curl or wget is required for one-line installation. Clone the repo and run bash install.sh instead."
    fi
}

prepare_downloaded_source() {
    TEMP_DIR="$(mktemp -d)"
    source_root="${TEMP_DIR}/.claude/skills"
    mkdir -p "$source_root"

    for skill in "${EXPECTED_SKILLS[@]}"; do
        mkdir -p "${source_root}/${skill}"
        download_file "${RAW_BASE}/.claude/skills/${skill}/SKILL.md" "${source_root}/${skill}/SKILL.md"
    done

    mkdir -p "${source_root}/slim-read/scripts"
    download_file \
        "${RAW_BASE}/.claude/skills/slim-read/scripts/slim_read.py" \
        "${source_root}/slim-read/scripts/slim_read.py"

    printf '%s\n' "$source_root"
}

find_source_root() {
    local_source_root=".claude/skills"

    if [ -d "$local_source_root" ]; then
        local_complete=true
        for skill in "${EXPECTED_SKILLS[@]}"; do
            if [ ! -f "${local_source_root}/${skill}/SKILL.md" ]; then
                local_complete=false
            fi
        done

        if [ "$local_complete" = true ]; then
            printf '%s\n' "$local_source_root"
            return
        fi

        info "Local .claude/skills exists but does not contain the Claude Frugal package."
    fi

    info "Downloading skill package from ${REPO_URL}."
    prepare_downloaded_source
}

validate_source_root() {
    source_root="$1"

    for skill in "${EXPECTED_SKILLS[@]}"; do
        [ -f "${source_root}/${skill}/SKILL.md" ] || fail "Missing ${source_root}/${skill}/SKILL.md"
    done
    [ -f "${source_root}/slim-read/scripts/slim_read.py" ] || fail "Missing slim-read helper script"
}

install_skill() {
    source_root="$1"
    skill="$2"
    source_dir="${source_root}/${skill}"
    target_dir="${TARGET_ROOT}/${skill}"

    if [ -f "${TARGET_ROOT}/${skill}.md" ]; then
        warn "Legacy flat skill file found: ${TARGET_ROOT}/${skill}.md"
        warn "Claude Frugal now installs ${target_dir}/SKILL.md. Remove the old file manually if it causes conflicts."
    fi

    mkdir -p "$target_dir"
    cp -R "${source_dir}/." "$target_dir/"
    chmod 644 "${target_dir}/SKILL.md"

    if [ -d "${target_dir}/scripts" ]; then
        find "${target_dir}/scripts" -type f -name "*.py" -exec chmod 755 {} \;
    fi

    ok "Installed ${skill}"
}

main() {
    printf '\nClaude Frugal installer\n'
    printf 'Target: %s\n\n' "$TARGET_ROOT"

    source_root="$(find_source_root)"
    validate_source_root "$source_root"

    mkdir -p "$TARGET_ROOT"

    for skill in "${EXPECTED_SKILLS[@]}"; do
        install_skill "$source_root" "$skill"
    done

    printf '\nInstalled skills:\n'
    for skill in "${EXPECTED_SKILLS[@]}"; do
        if [ -f "${TARGET_ROOT}/${skill}/SKILL.md" ]; then
            printf '  - %s\n' "${TARGET_ROOT}/${skill}/SKILL.md"
        else
            fail "Verification failed for ${skill}"
        fi
    done

    printf '\nUsage examples:\n'
    printf '  Ask Claude Code: "Use slim-read to inspect demo/token-calculator.py"\n'
    printf '  Ask Claude Code: "Run distill before I compact this session"\n'
    printf '  Ask Claude Code: "Check whether this context is getting large"\n'
    printf '\nDocs: %s\n\n' "$REPO_URL"
}

main "$@"
