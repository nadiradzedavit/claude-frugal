# Security Policy

## Supported Versions

Claude Frugal is currently in beta (v1.0.x). Security updates are provided for:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take security seriously, even for efficiency tools. If you discover a security vulnerability, please report it responsibly.

### What to Report

Security issues in Claude Frugal might include:
- **Skill injection**: Malicious skills that execute unintended commands
- **Token theft**: Skills that leak API keys or authentication tokens
- **Path traversal**: Skills that access files outside intended directories
- **Code execution**: Skills that enable arbitrary code execution
- **Privacy leaks**: Skills that expose sensitive conversation data

### How to Report

**DO NOT** open a public GitHub issue for security vulnerabilities.

Instead, please email: **nadiradzedavit@gmail.com** with:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

### Response Timeline

- **24-48 hours**: Initial acknowledgment
- **7 days**: Assessment and severity classification
- **30 days**: Fix released (or explanation if not applicable)

### Disclosure Policy

- We will acknowledge your responsible disclosure
- You will be credited in CHANGELOG.md (unless you prefer anonymity)
- We will coordinate public disclosure timing with you
- We follow a 90-day disclosure deadline

## Security Best Practices for Users

When using Claude Frugal skills:

1. **Review skill content**: Before installing community skills, read the `.md` files to understand what they do
2. **Trust sources**: Only install skills from the official repository or trusted contributors
3. **Monitor behavior**: Watch for unexpected file access or command execution
4. **Report suspicious activity**: If a skill behaves oddly, report it immediately

## Out of Scope

The following are **not** security issues:
- Token usage efficiency lower than claimed (this is a quality issue, not security)
- Claude Code API rate limiting or pricing changes
- User misconfiguration of skills
- Quality degradation from aggressive compression

## Attribution

We gratefully acknowledge security researchers who help keep Claude Frugal safe. Contributors will be listed here:

- *(No security reports yet - be the first!)*

---

**Thank you for helping keep Claude Frugal secure!**
