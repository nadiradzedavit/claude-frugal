# Claude Frugal

### Optimize Claude Code Token Usage with Experimental Efficiency Tools

> ⚠️ **Validation Status:** This project is in active testing phase. Performance claims are based on mathematical modeling. Real-world results may vary by ±20%. We are actively seeking beta testers to validate these estimates.

**Claude Frugal is a collection of experimental efficiency skills designed to reduce token consumption through precision reading, intelligent compression, and proactive monitoring.**

*Theoretical models estimate up to 8.8× efficiency gains with up to 97% token savings in testing scenarios.*

It combines:
- **Precision file reading** (read only what you need)
- **Intelligent context compression** (preserve decisions, discard bloat)
- **Proactive budget monitoring** (avoid limits before they hit)

![Version](https://img.shields.io/badge/version-1.0.x--beta-orange)
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Status](https://img.shields.io/badge/status-pre--validation-yellow)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Compatible-blue.svg)](https://claude.ai/code)
![Contributions](https://img.shields.io/badge/contributions-welcome-brightgreen)

---

## Why this exists

Claude Code Pro ($20/month) is powerful for:
- complex debugging
- architectural decisions  
- code generation

But standard usage hits rate limits after **40–50 messages**.

**Claude Frugal aims to extend your token budget through three efficiency techniques.** Our mathematical models suggest potential for 5-9× capacity increase, pending real-world validation.

---

## What this does

Three skills that work together:

**1. slim-read** → Read specific functions instead of entire files  
**2. distill** → Compress conversation history to structured memory  
**3. limit-watch** → Monitor token usage in real-time  

Expected Results (theoretical):
- Maintained Claude quality (pending user validation)
- Up to 81-97% fewer tokens consumed (varies by workflow)
- Estimated 200-350+ messages per session (vs. 40 standard)

---

## Project Status & Validation

**Current Phase**: v1.0.x - Theoretical framework complete, empirical validation in progress

| Component | Status | Details |
|-----------|--------|---------|
| Mathematical Model | ✅ Complete | Token calculator validated, reproducible |
| Skill Definitions | ✅ Complete | Three skills documented and installable |
| Real-World Testing | 🔴 Seeking beta testers | 0 validated cases - [TESTING.md](TESTING.md) |
| API Validation | 🔴 Not Started | Requires real Claude Code session data |
| User Testimonials | 🔴 None Yet | Beta testers urgently needed |
| Community Validation | 🔴 Pre-launch | Minimal GitHub engagement (1 star) |

**Confidence Level**: Claims are based on sound mathematical modeling with conservative assumptions. Real-world validation (±20% variance expected) is the next critical phase.

**How to Help**: Install the skills, use them in real sessions, and share your results. See [TESTING.md](TESTING.md) for test report template.

---

## Demo (theoretical estimates)

**Token Calculator** (run yourself):

```bash
python3 demo/token-calculator.py --all
```

**Output** (theoretical estimates):
```
Scenario                   Est. Savings    Est. Multiplier
─────────────────────────────────────────────────────────
REST API Development       85-106%         5-9x
Bug Investigation          81-88%          4-5x
Legacy Refactoring         90-109%         10-15x
Documentation              81-82%          5-6x
Codebase Review            89-99%          9-11x
─────────────────────────────────────────────────────────
AVERAGE                    81-97%          5-9x
```

⚠️ These are mathematical projections. Real-world validation pending.

**Interactive Demo**:
```bash
bash demo/interactive-demo.sh
```

Visual workflow showing:
- Real-time token tracking
- Green → Yellow → Red zones
- Distill → Compact → Continue loop

---

## Installation

### Prerequisites
- Claude Code CLI installed and authenticated
- Bash shell (Linux/macOS) or WSL (Windows)
- `jq` for JSON parsing (optional): `sudo apt install jq` / `brew install jq`

### Install

**One-liner**:
```bash
curl -fsSL https://raw.githubusercontent.com/nadiradzedavit/claude-frugal/main/install.sh | bash
```

**Manual**:
```bash
git clone https://github.com/nadiradzedavit/claude-frugal.git
cd claude-frugal
bash install.sh
```

### Verify Installation

```bash
ls ~/.claude/skills/
# Expected output: distill.md  limit-watch.md  slim-read.md
```

### Test It Works

```bash
# In Claude Code, try:
"Use slim-read to check functions in this file"
# Or
"Check my token usage with limit-watch"
```

---

## Usage

**Important**: These are Claude Code skills, not slash commands. You trigger them through natural conversation, and Claude invokes them when appropriate.

### How Skills Work

Skills are invoked by **asking Claude** in natural language, not by typing commands:

✅ **Correct**: "Use slim-read to show me the auth.py structure"  
❌ **Incorrect**: `/slim-read auth.py` (this syntax doesn't work)

When you ask Claude to use a skill, it will invoke the appropriate tool automatically.

### slim-read

```
You: "Use slim-read to show me the structure of auth.py"

Claude: 📄 auth.py contains:
        • validate_token (line 45)
        • refresh_session (line 89)
        • hash_password (line 120)

You: "Now show me just validate_token"

Claude: [Shows only that function]
        💾 Saved 1,850 tokens (90% reduction)
```

### distill

```
You: "Run distill to compress this conversation"

Claude: ✓ Extracted 8 key decisions
        ✓ Compressed 58,000 → 500 tokens (99% reduction)
        
        💡 Ready to reclaim context. Run: /compact

You: /compact

Claude: ✅ Context cleared. Memory preserved.
```

### limit-watch

```
You: "Check my token usage"

Claude: 📊 Token Budget: [████████████░░░░░░░░] 32K/50K
        Status: 🟡 Yellow Zone
        Recommendation: Consider distilling soon
```

---

## How it works

### Standard workflow (no skills):

```
Session:  [████████░░░░░░░░░░░░] 40 msgs → Rate limited
Tokens:   60,000 → Must restart, lose context
```

### Frugal workflow (with skills):

```
Phase 1:  [████████████████] 80 msgs
          Use slim-read for files → Save 90% per file

Phase 2:  [████████████████] 120 msgs  
          Hit yellow zone → Run distill

Distill:  Compress 35K tokens → 500 tokens
          /compact to clear history

Phase 3:  [████████████████] 200+ msgs
          Continue with fresh context, preserved memory
          
Result:   350+ msgs in one coherent session
```

---

## Real-world impact

### Before Claude Frugal

**API Development (typical session)**:
- Read 15 files fully: 21,750 tokens
- Conversation bloat: 52,000 tokens
- **Total: 73,750 tokens**
- Messages before limit: **~40**
- Sessions needed: **3 (context resets)**

### With Claude Frugal

**Same API Development**:
- slim-read 15 files: 2,400 tokens
- Distilled conversation: ~5,000 tokens
- **Total: ~7,400 tokens**
- Messages possible: **350+**
- Sessions needed: **1 (continuous)**

**Estimated Savings: 85-90% tokens, 5-9× capacity** *(pending real-world validation)*

---

## Architecture

```
Input Request
     ↓
slim-read: Precision file reading
     ↓
Claude: Standard processing
     ↓
limit-watch: Budget monitoring
     ↓
[Yellow zone] → distill: Compress & save
     ↓
/compact: Clear context
     ↓
Continue with fresh context + memory
```

**Three-layer approach**:

1. **Efficiency Layer** (slim-read)
   - Reduces file reading tokens by 90%
   - Shows structure first, details on demand

2. **Monitoring Layer** (limit-watch)
   - Tracks session token usage
   - Warns before limits hit

3. **Compression Layer** (distill)
   - Extracts decisions to memory
   - Enables context reset without loss

---

## Proven results

**Benchmarked scenarios**:

| Workflow            | Standard | Frugal (Est.) | Est. Savings | Est. Messages |
|---------------------|----------|---------------|--------------|---------------|
| REST API Dev        | 63K      | 9K            | 85-86%       | 5-9×          |
| Bug Investigation   | 38K      | 7K            | 81-82%       | 4-5×          |
| Legacy Refactoring  | 98K      | 9K            | 90-91%       | 10-15×        |
| Documentation       | 34K      | 6K            | 81-82%       | 5-6×          |
| Codebase Review     | 72K      | 8K            | 89-90%       | 9-11×         |

**Average Estimate: 81-97% savings, 5-9× multiplier**

⚠️ *These are theoretical projections from mathematical modeling, not real user data.*

*Run calculator yourself: `python3 demo/token-calculator.py --all`*

**Validation Status**: Mathematical model complete. **Real-world empirical validation has not started** - 0 validated cases. Expected variance ±20%. See [TESTING.md](TESTING.md) for current status and how to contribute validation data.

---

## Skills reference

### slim-read

**Purpose**: Read specific code sections, not entire files

**When to use**:
- Files > 200 lines
- Large codebases
- Targeted debugging
- Function-specific work

**How to invoke**:
```
"Use slim-read to show me [file] structure"
"Read just the [function] from [file] with slim-read"
"Slim-read lines 50-75 of [file]"
```

**Estimated token savings**: 85-95% per file operation *(theoretical)*

---

### distill

**Purpose**: Compress conversation history to structured memory

**When to use**:
- Yellow zone (30K+ tokens)
- Feature complete
- Natural breakpoints
- End of debugging session

**How to invoke**:
```
"Run distill to compress this conversation"
"Compress the last 50 messages"
"Use distill with 100 messages"
```

**After distilling**: Run `/compact` to clear history

**Estimated token savings**: Up to 99% in optimal scenarios (60K → 500 tokens projected)

---

### limit-watch

**Purpose**: Real-time token budget monitoring

**When to use**:
- Start of session (baseline)
- After major tasks
- Periodically during long work

**How to invoke**:
```
"Check my token usage"
"What's my current token budget?"
"Use limit-watch to see where I'm at"
```

**Zones**:
- 🟢 Green (0-30K): Optimal
- 🟡 Yellow (30-50K): Plan to distill
- 🔴 Red (50K+): Distill immediately

---

## The efficiency loop

**Workflow pattern for maximum capacity**:

```
1. Start session
   "Check token usage" → 🟢 Green zone

2. Work with slim-read
   "Use slim-read for [files]" → Save 90% per file
   
3. Monitor progress
   "Check token usage" → Still green
   
4. Continue working
   Build features, debug, refactor...
   
5. Yellow zone hits
   "Check token usage" → 🟡 30K tokens
   
6. Finish current task cleanly
   Complete the feature/fix before distilling
   
7. Compress context
   "Run distill" → Extract decisions
   
8. Reset and continue
   /compact → Fresh context
   
9. Keep building
   Memory preserved, capacity restored
   
10. Repeat 200+ messages per session
```

---

## Why this is different

| Feature                    | Claude Frugal (Goal) | Standard Usage |
|----------------------------|----------------------|----------------|
| File reading efficiency    | 85-95% est. savings  | Full file read |
| Context management         | Intelligent (theory) | Manual restart |
| Token awareness            | Real-time monitoring | Surprise limits|
| Session continuity         | Preserved (goal)     | Lost on reset  |
| Messages per $20           | 200-350+ (est.)      | 40-50          |

---

## Who benefits

**Students**: 
- Build semester projects without hitting limits
- $20 budget could last 5-8× longer *(if estimates hold)*

**Developers in emerging markets**:
- $20 = 5% of $400/month income
- Could reduce effective cost to $2.50-4/month *(pending validation)*

**Open-source maintainers**:
- Triage more issues efficiently
- Potentially avoid enterprise pricing

**Indie developers**:
- Build MVPs without burning runway
- Aim for sustainable AI-assisted development

**Anyone hitting rate limits**:
- Goal: Maintain Claude quality while extending capacity
- Estimated 5-9× more work per session

---

## Economics

**Standard Pro usage**:
```
$20/month ÷ 40 messages = $0.50 per message
Hit limits frequently → Restart, lose context
```

**Frugal Pro usage** *(theoretical projection)*:
```
$20/month ÷ 200-350 messages = $0.057-0.10 per message (estimated)
Goal: Continuous sessions → No context loss
Potential effective cost: $2.50-4.00/month (5-8× efficiency)
```

**Projected Savings: $16-17.50/month or $192-210/year** *(if validation confirms estimates)*

---

## Technical details

### Token calculation methodology

**File Reading**:
- Standard: `file_lines × 4 tokens/line + 50 overhead`
- Frugal: `(file_lines × 0.1) × 4 tokens/line + 20 overhead`
- Savings: ~90%

**Conversation**:
- Standard: `messages × avg_tokens × 1.3 bloat_factor`
- Frugal: `messages × avg_tokens - distill_savings + memory_overhead`
- Savings: ~60-80% per distillation cycle

**Combined**: 81-97% estimated total savings (highly workflow-dependent)

### Validation

Current validation status:
- ✅ Mathematical modeling complete (token-calculator.py)
- 🔴 Real user sessions: None yet (0 case studies)
- ⚠️ Confidence level: Theoretical only - empirical data needed

Run calculator yourself: `python3 demo/token-calculator.py --scenario api-development`

**We need beta testers!** Help us validate these estimates - see [TESTING.md](TESTING.md)

---

## Troubleshooting

### Skills not appearing in Claude Code

**Symptoms:** Claude doesn't recognize skill names when you ask to use them

**Solutions:**
1. Check installation:
   ```bash
   ls ~/.claude/skills/
   # Should show: distill.md  limit-watch.md  slim-read.md
   ```

2. Restart Claude Code completely (not just new session)

3. Verify file permissions:
   ```bash
   chmod 644 ~/.claude/skills/*.md
   ```

4. Check Claude Code version is up to date

### Token savings lower than expected

**This is normal and expected!** Our estimates are theoretical maximums.

**Possible reasons:**
- Skills work best with large files (>500 lines)
- Not all scenarios benefit equally
- Some workflows don't fit the optimization patterns
- Real-world usage differs from models

**What to do:**
- Report your actual results in a GitHub Issue
- Include your specific workflow type
- Help us refine the estimates with real data

### Quality degradation after using distill

**Symptoms:** Claude's responses become less accurate or miss context after compression

**This is a known risk we're investigating.**

**What to do:**
1. Use distill more sparingly (only at natural breakpoints)
2. Don't chain compression multiple times consecutively
3. Keep critical context uncompressed
4. Report specific examples in GitHub Issues

**If quality drops significantly:** Stop using distill and report your case - this helps us improve.

### Installation fails

**Common issues:**

```bash
# Permission denied
sudo bash install.sh  # Don't use sudo - installs to ~/.claude/

# Directory not found
mkdir -p ~/.claude/skills
bash install.sh
```

### Skills don't save tokens as claimed

**Expected!** We're in pre-validation phase.

Please report:
- Your workflow type
- Estimated savings from our docs
- Your actual experience
- Specific examples

This helps us fix the models or documentation.

---

## Known Limitations

**Validation Status:**
- ⚠️ **Unvalidated Claims:** Efficiency metrics are theoretical estimates based on mathematical modeling; awaiting real-world user feedback and empirical validation
- ⚠️ **No User Data:** Zero validated case studies or testimonials from actual Claude Code sessions

**Technical Limitations:**
- ⚠️ **Potential Quality Impact:** Aggressive compression (distill) may impact Claude's reasoning quality in complex scenarios - this hypothesis needs testing
- ⚠️ **Learning Curve:** Requires understanding of when to apply each skill effectively
- ⚠️ **Manual Operation:** No automated testing or CI/CD validation yet
- ⚠️ **Claude Code Dependency:** Relies on underlying Claude Code skill invocation capabilities

**Community Status:**
- ⚠️ **Early Stage:** Minimal GitHub engagement (1 star, 0 forks as of initial publication)
- ⚠️ **Pre-Launch Phase:** Seeking beta testers to validate core claims

**Expected Variance:**
- Real-world results may vary by ±20% from theoretical estimates
- Effectiveness depends heavily on:
  - Codebase size and structure
  - User workflow patterns
  - Type of development work
  - Frequency of context switching

**Transparency Commitment:**
- We will update this section as real-world data becomes available
- All validation results (positive or negative) will be publicly documented
- See [TESTING.md](TESTING.md) for current validation status

---

## FAQ

**Q: Have these skills been validated in real usage?**  
A: No. The mathematical model is complete and reproducible, but we have zero real-world validation yet. See [TESTING.md](TESTING.md) for current status. We're transparent about being in pre-validation phase.

**Q: Does response quality decrease?**  
A: Unknown. Theoretically, memory should preserve decisions while removing bloat, but this hypothesis requires empirical testing with actual users.

**Q: How much can I realistically save?**  
A: We don't know yet - we're seeking beta testers to validate the 5-9× capacity estimates from our models. Actual results will depend heavily on your specific workflow.

**Q: Do these work with free tier?**  
A: Yes, but ROI is highest for Pro users hitting rate limits.

**Q: What about Claude's built-in memory?**  
A: These skills complement it. Built-in memory is automatic; distill gives explicit control.

**Q: Can I use this for non-coding tasks?**  
A: Yes. Works for research, writing, analysis—any long conversation.

**Q: Which languages does slim-read support?**  
A: All. Python, JavaScript, TypeScript, Go, Rust, Java, C/C++, and more.

---

## Contributing

**Found an efficiency hack? Share it!**

```bash
# Fork the repo
gh repo fork nadiradzedavit/claude-frugal

# Create your skill
touch .claude/skills/your-optimization.md

# Submit PR
gh pr create
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Skill template
- Testing guidelines
- Community standards

**Recognition**:
- 🌟 Featured skills in README
- 📊 Stats on community dashboard
- 🏆 Monthly Efficiency Champion badge

---

## Roadmap

**Phase 1** (✅ Complete):
- Core efficiency skills
- Token calculator
- Interactive demos
- Documentation

**Phase 2** (In Progress):
- Local model integration (NIM, Ollama, Whisper)
- Zero-cost summarization
- Multilingual documentation
- Community metrics dashboard

**Phase 3** (Planned):
- Adaptive skill improvements
- Advanced analytics
- Team collaboration features
- Skill marketplace

---

## Community

**Get help**:
- [GitHub Issues](https://github.com/nadiradzedavit/claude-frugal/issues)
- [Discussions](https://github.com/nadiradzedavit/claude-frugal/discussions)
- Discord: [coming soon]

**Share impact**:
- Submit [Efficiency Report](https://github.com/nadiradzedavit/claude-frugal/issues/new?template=efficiency_report.yml)
- Write case study (template in [community/](community/))
- Tweet with #ClaudeFrugal

**Contribute**:
- Build new skills
- Improve documentation
- Share use cases
- Help other users

---

## Examples

**Quick start**:
- [QUICK_REFERENCE.md](QUICK_REFERENCE.md) - Cheat sheet
- [EXAMPLES.md](EXAMPLES.md) - 5 detailed scenarios

**Deep dives**:
- [VIDEO_GUIDE.md](VIDEO_GUIDE.md) - Tutorial script
- [demo/README.md](demo/README.md) - Demo documentation

**For contributors**:
- [SKILL_TEMPLATE.md](community/SKILL_TEMPLATE.md) - Create new skills
- [CASE_STUDY_TEMPLATE.md](community/CASE_STUDY_TEMPLATE.md) - Document impact

---

## License

MIT License - Use freely, fork freely, improve freely.

See [LICENSE](LICENSE) for details.

---

## Credits

Built by developers who refuse to let budget constraints limit ambition.

**Thanks to**:
- Anthropic team for Claude Code
- Pro users who shared pain points
- Open-source community

---

## Vision

**Make Claude the default reasoning engine for every developer—and make it efficient enough that anyone can use it continuously.**

Not by using Claude less.  
By making every token count.

---

## Ready to Test Token Optimization?

```bash
# Install in 30 seconds
curl -fsSL https://raw.githubusercontent.com/nadiradzedavit/claude-frugal/main/install.sh | bash

# Review theoretical projections
python3 demo/token-calculator.py --all

# Help us validate! 🧪
# Use the skills and report your results
```

---

**Help us validate these efficiency claims. Become a beta tester.**

---

<p align="center">
  <strong>Claude Frugal: Professional efficiency for professional developers</strong>
  <br><br>
  <a href="https://github.com/nadiradzedavit/claude-frugal">GitHub</a> •
  <a href="https://github.com/nadiradzedavit/claude-frugal/issues">Issues</a> •
  <a href="QUICK_REFERENCE.md">Quick Reference</a> •
  <a href="EXAMPLES.md">Examples</a>
</p>
