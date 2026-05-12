# Changelog

## Unreleased

- Converted skills to the Claude Code directory format with `SKILL.md`.
- Added a dependency-free `slim-read` Python helper for structure, symbol, and
  line-range extraction.
- Updated `install.sh` to support both cloned installs and `curl | bash`.
- Simplified README and package metadata around beta validation.
- Replaced Playwright sample tests with project-specific Node tests.
- Enabled CI workflow for skill layout, installer, helper, and calculator checks.
- Moved grant, strategy, and old launch material out of the repository root.

## 0.1.0

- Initial beta release with three experimental skills:
  - `slim-read`
  - `distill`
  - `limit-watch`
- Added token calculator and interactive demo.
