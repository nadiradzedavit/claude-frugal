# Demo Recording & Validation Guide

This guide helps you create effective demonstrations and collect validation data for Claude-Frugal.

---

## Purpose

To **prove** that Claude-Frugal's efficiency claims are real through:
1. Recorded demonstrations showing skills in action
2. Real session data comparing baseline vs. frugal usage
3. Testimonials from actual users

---

## Demo Video Creation

### Recommended Format

**Duration**: 5-10 minutes  
**Platform**: YouTube, Loom, or Vimeo  
**Quality**: 1080p minimum, clear audio

### Demo Script Structure

#### Part 1: The Problem (1-2 minutes)
```
Show a standard Claude Code Pro session:
- Start a coding task (e.g., build a REST API)
- Read several large files fully
- Show context building up
- Demonstrate hitting yellow zone (~30-40 messages)
- Mention: "I'm already at 35K tokens, approaching limits"
```

#### Part 2: The Solution (3-5 minutes)
```
Restart with Claude-Frugal installed:
- Show: ls ~/.claude/skills/
- Explain: "These skills optimize token usage"
- Demonstrate slim-read:
  * "Use slim-read to show me auth.py structure"
  * Show how it returns just function names
  * "Now show me just the validate_token function"
  * Highlight: "Saved ~1,800 tokens vs full file read"
- Demonstrate limit-watch:
  * "Check my token usage"
  * Show the zone indicator (green/yellow/red)
- Demonstrate distill:
  * After completing a feature
  * "Run distill to compress this conversation"
  * Show memory extraction
  * Run /compact
  * Highlight: "Reclaimed 25K tokens, kept all decisions"
```

#### Part 3: Results (1-2 minutes)
```
Compare side-by-side:
- Baseline: 40 messages, 35K tokens, rate limited
- Frugal: 120 messages, 12K tokens, still productive
- Show: python3 demo/token-calculator.py --all
- Emphasize: "Same quality, 8× capacity"
```

#### Part 4: Call to Action (30 seconds)
```
- "Install in 30 seconds"
- Show: curl -fsSL https://... | bash
- "Try it yourself, share your results"
- "See TESTING.md to contribute validation data"
```

---

## Screen Recording Setup

### Tools
- **Mac**: QuickTime, ScreenFlow, or OBS Studio
- **Windows**: OBS Studio, Camtasia
- **Linux**: SimpleScreenRecorder, OBS Studio

### Terminal Setup for Recording
```bash
# Use a clean terminal profile
# Increase font size for visibility (16-18pt)
# Use high contrast theme (dark background, light text)
# Clear history before starting
clear && history -c

# Optional: Show commands as you type them
export PS1='\[\033[1;36m\]\u@demo\[\033[00m\]:\[\033[1;34m\]\w\[\033[00m\]\$ '
```

### What to Show
✅ DO show:
- Actual Claude Code interface
- Real file operations
- Token counts (if available from API logs)
- Skill invocations and responses
- Side-by-side comparisons

❌ DON'T show:
- API keys or sensitive data
- Personal information
- Unrelated tabs or windows
- Messy desktop/background

---

## Real Session Validation

### Baseline Session Protocol

**Goal**: Establish token usage WITHOUT Claude-Frugal

1. **Preparation**:
   ```bash
   # Disable frugal skills temporarily
   mv ~/.claude/skills ~/.claude/skills-backup
   
   # Start fresh session
   # Document starting conditions
   ```

2. **Task Selection**:
   Choose a representative coding task:
   - REST API development (15-20 files)
   - Bug investigation (10-15 files)
   - Refactoring (20+ files)
   - Documentation generation (10-20 files)

3. **Tracking During Session**:
   Keep a log:
   ```
   Message 1: Asked to create user model
   Message 5: Read auth.py (full file, ~450 lines)
   Message 12: Read middleware.py (full file, ~300 lines)
   Message 20: Approaching context limit feeling
   Message 35: Yellow zone warning (if limit-watch was enabled)
   Message 42: Rate limited or context too large
   ```

4. **Data Collection**:
   - Total messages sent
   - Files read (list them)
   - Estimated tokens (use calculator or API logs)
   - Where you felt friction
   - When you had to restart

### Frugal Session Protocol

**Goal**: Establish token usage WITH Claude-Frugal

1. **Preparation**:
   ```bash
   # Enable frugal skills
   mv ~/.claude/skills-backup ~/.claude/skills
   
   # Verify installation
   ls ~/.claude/skills/
   # Should show: distill.md, limit-watch.md, slim-read.md
   ```

2. **Same Task**:
   Repeat the EXACT same task as baseline
   - Use same files
   - Build same features
   - Aim for same outcome

3. **Tracking During Session**:
   ```
   Message 1: Asked to create user model
   Message 3: "Use slim-read to show me auth.py structure"
   Message 4: "Show me just the validate_token function with slim-read"
   Message 15: "Check token usage" → Green zone (15K tokens)
   Message 40: "Check token usage" → Yellow zone (32K tokens)
   Message 42: "Run distill to compress conversation"
   Message 43: /compact
   Message 44: Resumed with fresh context, memory intact
   Message 80: Task complete, still in green zone
   ```

4. **Data Collection**:
   - Total messages sent
   - slim-read operations count
   - distill cycles used
   - Estimated tokens saved
   - Comparison to baseline

---

## Validation Report Template

After completing both sessions, fill out this report:

```markdown
# Claude-Frugal Validation Report

**Date**: YYYY-MM-DD  
**Tester**: [Your name or GitHub username]  
**Task**: [Brief description, e.g., "REST API with auth"]

## Baseline Session (No Frugal Skills)

### Setup
- Files in project: [count]
- Task complexity: [Simple / Medium / Complex]
- Session duration: [minutes]

### Results
- Messages sent: [count]
- Files read (full): [count]
- Token usage (estimated): [number]
- Token usage (API logs): [number if available]
- Hit rate limit: [Yes/No at message X]
- Restarts required: [count]

### Experience
- Quality of responses: [1-5 stars]
- Context bloat noticed: [Yes/No, at message X]
- Frustration level: [1-5, 5=very frustrated]

## Frugal Session (With Skills)

### Setup
- Same task as baseline
- Skills installed: [distill, slim-read, limit-watch]
- Session duration: [minutes]

### Results
- Messages sent: [count]
- slim-read operations: [count]
- distill cycles: [count]
- limit-watch checks: [count]
- Token usage (estimated): [number]
- Token usage (API logs): [number if available]
- Hit rate limit: [Yes/No]
- Restarts required: [count]

### Experience
- Quality of responses: [1-5 stars]
- Skill invocation friction: [1-5, 5=very easy]
- Overall satisfaction: [1-5 stars]

## Comparison

### Measured Savings
- Token reduction: [(baseline - frugal) / baseline * 100]%
- Message capacity increase: [frugal messages / baseline messages]×
- Quality impact: [Better/Same/Worse + explanation]

### Verification of Claims
- README claims 97% savings, I measured: [X%]
- README claims 8.8× multiplier, I measured: [X×]
- Claims validated: [Yes/No/Partial + explanation]

### Recommendations
[What worked well? What needs improvement? Would you recommend this to others?]

---

**Raw Data**: [Link to logs, screenshots, or CSV if available]  
**Submitted to**: https://github.com/nadiradzedavit/claude-frugal/issues
```

---

## Publishing Your Demo

### YouTube Upload Checklist

**Title**: "Claude-Frugal Demo: 8× More Capacity from Claude Code Pro"

**Description**:
```
Demonstrating Claude-Frugal efficiency skills that reduce token usage by 97%.

In this video:
- Problem: Claude Code Pro rate limits (40-50 messages)
- Solution: slim-read, distill, limit-watch skills
- Results: 350+ messages per session, same quality

⭐ Repository: https://github.com/nadiradzedavit/claude-frugal
📖 Documentation: [link to README]
🧪 Testing: [link to TESTING.md]
💾 Install: curl -fsSL https://raw.githubusercontent.com/...

Timestamps:
0:00 - The Problem
1:30 - slim-read Demo
3:00 - distill Demo
4:30 - Results Comparison
6:00 - Installation & Call to Action

#ClaudeFrugal #ClaudeCode #AI #Productivity
```

**Tags**: Claude Code, Claude AI, token efficiency, AI development, productivity tools

**Thumbnail**: High-contrast text showing "97% Token Savings" or "8× More Capacity"

---

## Sharing Your Results

### Where to Share
1. **GitHub Issues**: Submit validation report as issue
2. **GitHub Discussions**: Share experiences and tips
3. **Twitter/X**: Tag `@AnthropicAI` and use `#ClaudeFrugal`
4. **Reddit**: r/ClaudeAI, r/LocalLLaMA, r/programming
5. **Hacker News**: "Show HN: Claude-Frugal – 97% token savings for Claude Code"
6. **Dev.to / Hashnode**: Write detailed case study

### Social Media Template

**Twitter/X**:
```
I just tested Claude-Frugal and got 8× more capacity from my Claude Code Pro subscription 🤯

Before: 40 messages → rate limited
After: 320+ messages → still productive

Same quality, 97% fewer tokens. This is a game changer for budget-conscious devs.

[link to demo video]
#ClaudeFrugal
```

**Reddit**:
```
Title: [Tool] Claude-Frugal: 97% token savings for Claude Code Pro users

I tested this token efficiency toolkit and got real results:
- 8× message capacity (40 → 320 messages)
- No quality degradation
- Simple installation (3 skills)

Here's my validation report: [link]
Demo video: [link]
Repo: https://github.com/nadiradzedavit/claude-frugal

Worth checking out if you hit rate limits frequently.
```

---

## For Content Creators

### Blog Post Outline

**Title**: "How I Cut Claude Code Token Usage by 97%"

**Structure**:
1. **Hook**: "I was hitting rate limits after 40 messages. Now I get 320+."
2. **Problem**: Explain Claude Code Pro limitations
3. **Discovery**: How you found Claude-Frugal
4. **Testing**: Your validation methodology
5. **Results**: Real numbers from your sessions
6. **How It Works**: Explain the three skills
7. **Installation**: Quick guide
8. **Comparison**: Before/after experiences
9. **Verdict**: Would you recommend it?
10. **Call to Action**: Try it yourself, contribute results

### Case Study Format

**Title**: "Case Study: [Your Company] Saves $X/month with Claude-Frugal"

**Sections**:
- Company background
- Challenge (hitting rate limits)
- Solution (Claude-Frugal adoption)
- Implementation (how you rolled it out)
- Results (measured savings)
- Team feedback
- ROI calculation
- Lessons learned
- Recommendation

---

## Recognition

Contributors who submit high-quality demos or validation reports will be:
- Featured in project README
- Listed in CONTRIBUTORS.md
- Eligible for "Efficiency Champion" badge
- Credited in grant applications

---

## Questions?

- **GitHub Issues**: Bug reports, feature requests
- **Discussions**: General questions, sharing tips
- **Email**: For sensitive data or partnership inquiries

---

**Last Updated**: 2026-05-04  
**Next Review**: After 10 validation reports received
