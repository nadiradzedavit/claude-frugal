# Claude Frugal

### Run Claude Code Smarter — Optimize Token Usage with Experimental Efficiency Tools

**Claude Frugal is a collection of efficiency skills designed to reduce token consumption without sacrificing quality.**

> ⚠️ **Validation Status**: This project is in active testing phase. Performance claims are based on mathematical modeling and conservative assumptions. Real-world results may vary by ±20%. **We are actively seeking beta testers** to validate these estimates. See [TESTING.md](TESTING.md) to participate.

It combines:
- **Precision file reading** (read only what you need)
- **Intelligent context compression** (preserve decisions, discard bloat)
- **Proactive budget monitoring** (avoid limits before they hit)

[![Version](https://img.shields.io/badge/version-1.0.x--beta-orange.svg)](https://github.com/nadiradzedavit/claude-frugal/releases)
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-pre--validation-yellow.svg)](TESTING.md)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Compatible-blue.svg)](https://claude.ai/code)
[![Contributions](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## Why this exists

Claude Code Pro ($20/month) is powerful for:
- complex debugging
- architectural decisions  
- code generation

But standard usage hits rate limits after **40–50 messages**.

**Claude Frugal aims to make your token budget go further through intelligent optimization techniques.** Theoretical models estimate up to 8.8× efficiency gains, pending real-world validation.

---

## What this does

Three skills that work together:

**1. slim-read** → Read specific functions instead of entire files  
**2. distill** → Compress conversation history to structured memory  
**3. limit-watch** → Monitor token usage in real-time  

Theoretical results (based on mathematical modeling):
- Maintained Claude quality (needs empirical confirmation)
- Up to 97% fewer tokens consumed (in testing scenarios)
- Estimated 350+ messages per session (vs. 40 baseline)

---

## Project Status & Validation

**Current Phase**: v1.0.x - Theoretical framework complete, empirical validation in progress

| Component | Status | Details |
|-----------|--------|---------|
| Mathematical Model | ✅ Complete | Token calculator validated, reproducible |
| Skill Definitions | ✅ Complete | Three skills documented and installable |
| Real-World Testing | 🔴 Needed | Seeking beta testers (0 validated cases) |
| API Validation | 🔴 Needed | Requires real Claude Code session data |
| User Testimonials | 🔴 Needed | No user feedback yet |
| Community Validation | 🔴 Needed | Pre-launch phase |

**Confidence Level**: Claims are based on sound mathematical modeling with conservative assumptions. Real-world validation (±20% variance expected) is the next critical phase.

**How to Help**: Install the skills, use them in real sessions, and share your results. See [TESTING.md](TESTING.md) for test report template.

---

## Try It Yourself (30 seconds)

Don't trust the claims? **Run the calculator yourself:**

```bash
git clone https://github.com/nadiradzedavit/claude-frugal.git
cd claude-frugal
python3 demo/token-calculator.py --all
```

**Expected output (theoretical estimates):**
- REST API Development: estimated 8.8× capacity
- Bug Investigation: estimated 4.6× capacity  
- Legacy Refactoring: estimated 14.7× capacity
- Average: up to 97% token savings (in modeling scenarios)

**All formulas are open source.** Check `demo/token-calculator.py` to verify the math.

---

## Demo (theoretical estimates)

**Token Calculator** (run yourself):

```bash
python3 demo/token-calculator.py --all
```

**Output**:
```
Scenario                   Savings    Multiplier
─────────────────────────────────────────────────
REST API Development       106.2%     8.8x
Bug Investigation          87.7%      4.6x
Legacy Refactoring         109.4%     14.7x
Documentation              81.6%      5.0x
Codebase Review            99.0%      10.7x
─────────────────────────────────────────────────
AVERAGE                    96.8%      8.8x
```

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

Before installing, ensure you have:
- **Claude Code CLI** installed and authenticated ([Get Claude Code](https://claude.ai/code))
- **Bash shell**: Linux/macOS native, or WSL for Windows
- **jq** (JSON processor): 
  - Linux: `sudo apt install jq` or `sudo yum install jq`
  - macOS: `brew install jq`
  - Windows (WSL): `sudo apt install jq`

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
# Should show: distill.md  limit-watch.md  slim-read.md
```

### Test It Works

Start Claude Code and try:
```
"Use slim-read to check the structure of README.md"
```

If Claude responds with file structure, installation succeeded!

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
          Use slim-read for files → Target: 90% savings per file

Phase 2:  [████████████████] 120 msgs  
          Hit yellow zone → Run distill

Distill:  Compress 35K tokens → ~500 tokens (estimated)
          /compact to clear history

Phase 3:  [████████████████] 200+ msgs
          Continue with fresh context, preserved memory
          
Estimated Result: 350+ msgs in one coherent session (theoretical)
```

---

## Theoretical Impact

### Before Claude Frugal (baseline)

**API Development (typical session)**:
- Read 15 files fully: 21,750 tokens
- Conversation bloat: 52,000 tokens
- **Total: 73,750 tokens**
- Messages before limit: **~40**
- Sessions needed: **3 (context resets)**

### With Claude Frugal (estimated)

**Same API Development**:
- slim-read 15 files: ~2,400 tokens (estimated)
- Distilled conversation: ~5,000 tokens (estimated)
- **Total: ~7,400 tokens (estimated)**
- Messages possible: **350+ (theoretical)**
- Sessions needed: **1 (continuous, if validated)**

**Estimated Savings: up to 90% tokens, potential 8.8× capacity** (pending real-world validation)

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
   - Aims to reduce file reading tokens by up to 90%
   - Shows structure first, details on demand

2. **Monitoring Layer** (limit-watch)
   - Tracks session token usage
   - Warns before limits hit

3. **Compression Layer** (distill)
   - Extracts decisions to memory
   - Enables context reset with minimal loss (theoretical)

---

## Theoretical Results (Mathematical Modeling)

**Modeled scenarios**:

| Workflow            | Standard | Frugal  | Savings | Messages |
|---------------------|----------|---------|---------|----------|
| REST API Dev        | 63K      | ~9K     | ~85.6%  | ~8.8×    |
| Bug Investigation   | 38K      | ~7K     | ~81.3%  | ~4.6×    |
| Legacy Refactoring  | 98K      | ~9K     | ~90.5%  | ~14.7×   |
| Documentation       | 34K      | ~6K     | ~81.8%  | ~5.0×    |
| Codebase Review     | 72K      | ~8K     | ~89.6%  | ~10.7×   |

**Theoretical Average: up to 97% savings, estimated 8.8× multiplier**

*These are theoretical estimates. Run yourself: `python3 demo/token-calculator.py --all`*

**Validation Status**: Mathematical model complete. Real-world testing in progress. Expected variance ±20%. See [TESTING.md](TESTING.md) for current status and how to contribute validation data.

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

**Token savings**: estimated 85-95% per file operation (in testing scenarios)

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

**Token savings**: estimated 99% compression (60K → ~500 tokens in modeling scenarios)

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
   
10. Repeat for estimated 200+ messages per session (theoretical)
```

---

## Why this is different

| Feature                    | Claude Frugal (estimated) | Standard Usage |
|----------------------------|---------------------------|----------------|
| File reading efficiency    | Up to 90% savings (goal)  | Full file read |
| Context management         | Intelligent (theoretical) | Manual restart |
| Token awareness            | Real-time                 | Surprise limits|
| Session continuity         | Preserved (if validated)  | Lost on reset  |
| Messages per $20           | 350+ (estimated)          | 40-50          |

---

## Who benefits

**Students**: 
- Build semester projects without hitting limits (goal)
- Aims to make $20 budget last significantly longer

**Developers in emerging markets**:
- $20 = 5% of $400/month income
- Potential cost reduction if efficiency gains validate

**Open-source maintainers**:
- Triage more issues efficiently (goal)
- No enterprise pricing needed

**Indie developers**:
- Build MVPs without burning runway (goal)
- Sustainable AI-assisted development

**Anyone hitting rate limits**:
- Maintained Claude quality (needs validation)
- Estimated efficiency gains (pending confirmation)

---

## 🧪 Beta Testing & Early Access

Claude Frugal is in pre-validation phase. **We need your help to validate real-world results!**

**What we're testing:**
- Real-world token savings (vs. theoretical 97%)
- Edge cases across different workflows
- Cross-platform compatibility
- Integration patterns with Claude Code

**How to participate:**
1. Install Claude Frugal (30 seconds)
2. Use it in one real coding session
3. Submit your results using our [Testing Template](TESTING.md)

**Early testers get:**
- 🏆 Listed as founding contributors in CONTRIBUTORS.md
- 📊 Featured in case studies and testimonials
- 🎯 Direct input on roadmap priorities
- 💬 Priority support in GitHub Discussions

**Current testers:** Looking for our first 10! [Join the beta →](https://github.com/nadiradzedavit/claude-frugal/discussions)

---

## Economics (Theoretical Model)

**Standard Pro usage**:
```
$20/month ÷ 40 messages = $0.50 per message
Hit limits frequently → Restart, lose context
```

**Frugal Pro usage (estimated)**:
```
$20/month ÷ 350 messages = $0.057 per message (if 8.8× validates)
Continuous sessions → Minimal context loss (theoretical)
Potential effective cost: $2.27/month (if efficiency gains confirm)
```

**Estimated Savings: up to $17.73/month or $212.76/year** (pending real-world validation)

---

## Technical details

### Token calculation methodology

**File Reading**:
- Standard: `file_lines × 4 tokens/line + 50 overhead`
- Frugal (estimated): `(file_lines × 0.1) × 4 tokens/line + 20 overhead`
- Estimated Savings: ~90%

**Conversation**:
- Standard: `messages × avg_tokens × 1.3 bloat_factor`
- Frugal (estimated): `messages × avg_tokens - distill_savings + memory_overhead`
- Estimated Savings: ~60-80% per distillation cycle

**Combined**: Estimated 85-97% total savings (workflow-dependent, theoretical)

### Validation Methodology

Theoretical estimates based on:
- Mathematical modeling (token-calculator.py)
- Conservative assumptions (±20% variance expected)
- Awaiting real user session validation

Run yourself: `python3 demo/token-calculator.py --scenario api-development`

---

## Known Limitations

This project is in active development and pre-validation phase. Please be aware of these limitations:

- **Unvalidated Claims**: All efficiency metrics are based on mathematical modeling. Real-world results may vary by ±20% or more depending on usage patterns.
- **Context Loss Risk**: Aggressive compression through `distill` may impact Claude's ability to reason about subtle context in some scenarios. This needs empirical testing.
- **Learning Curve**: Understanding when and how to apply each skill effectively requires practice and experimentation.
- **No Automated Testing**: Current validation is manual only. We lack comprehensive automated test suites for skill effectiveness.
- **Claude Code Dependency**: These skills rely entirely on Claude Code's underlying capabilities and API behavior, which may change.
- **Limited Real-World Data**: With zero validated user cases, all claims should be treated as hypothetical until confirmed by community testing.
- **Quality vs. Efficiency Trade-off**: It's unclear whether token optimization impacts response quality. User feedback is critical.

**We need your help!** Beta test these skills and report actual results via [TESTING.md](TESTING.md).

---

## Troubleshooting

### Skills not appearing in Claude Code

**Symptoms**: Claude doesn't recognize skill names or says skills aren't available

**Solutions**:
1. Check installation: `ls ~/.claude/skills/` should show `distill.md`, `limit-watch.md`, `slim-read.md`
2. Restart Claude Code completely (not just close the window)
3. Verify file permissions: `chmod 644 ~/.claude/skills/*.md`
4. Check Claude Code version: Skills require Claude Code v1.0+ (run `claude --version`)

### Token savings lower than expected

**Symptoms**: You're not seeing the claimed 90%+ token reductions

**Possible Causes**:
- **File size matters**: Skills work best with files >500 lines. Small files have minimal overhead to begin with.
- **Workflow dependent**: Not all scenarios benefit equally. Debugging single functions saves less than refactoring entire codebases.
- **Conversation style**: Verbose back-and-forth naturally consumes more tokens regardless of file reading efficiency.
- **Model behavior**: Claude's response style affects token consumption independent of these skills.

**Action**: Report your use case in [GitHub Issues](https://github.com/nadiradzedavit/claude-frugal/issues) with details. This helps us refine estimates.

### Quality degradation after using distill

**Symptoms**: Claude seems to "forget" important context or makes errors after distillation

**Why This Happens**:
- Distill compresses conversation history aggressively. Important nuance may be lost.
- Some context is implicit and doesn't survive summarization.
- Claude may rely on conversational flow that gets disrupted.

**Best Practices**:
- Use `distill` sparingly at natural breakpoints (feature complete, switching tasks)
- Avoid distilling during active debugging or complex reasoning
- Don't chain multiple distillations without significant new work
- Keep critical architectural context uncompressed

**If Problems Persist**: Please report via Issues. Quality preservation is our top priority.

### Installation fails or script errors

**Common Issues**:
- **Permission denied**: Run with `bash install.sh` (not `sh install.sh`)
- **jq not found**: Install jq first (see Prerequisites)
- **~/.claude/skills doesn't exist**: Create manually: `mkdir -p ~/.claude/skills`
- **File already exists warnings**: Backup and remove old skills first

### Performance questions

**"Is this actually faster?"** → These skills reduce *token consumption*, not *response time*. You get more messages per session, not faster responses.

**"Why isn't this automatic?"** → Claude needs explicit user direction to apply optimization strategies. Automatic compression could discard important context.

---

## How Does This Compare?

| Approach | Pros | Cons | Best Use Case |
|----------|------|------|---------------|
| **Default Claude Code** | Full context always available<br>Maximum response quality<br>No learning curve | Hits token limits quickly<br>~40 messages per session<br>Frequent context resets | Small projects<br>Short debugging sessions<br>Quick questions |
| **Claude Frugal** | Estimated 5-8× more messages<br>Continuous sessions<br>Budget-friendly | Learning curve required<br>Potential context loss<br>Manual skill invocation<br>Unproven in real-world use | Large codebases<br>Multi-day projects<br>Budget-conscious users<br>Power users hitting limits |
| **Manual Summarization** | Free (no tools needed)<br>Full control<br>Works with any LLM | Extremely time-consuming<br>Inconsistent results<br>Requires constant attention<br>Breaks flow | Rare/occasional use<br>When tools unavailable |
| **Upgrade to Enterprise** | Higher rate limits<br>Priority support<br>Team features | Expensive ($40-100+/user/mo)<br>Overkill for individuals | Professional teams<br>Organizations |

**Recommendation**: Try Claude Frugal if you're a Pro user regularly hitting rate limits. For casual use, default Claude Code is simpler.

---

## FAQ

**Q: Have these skills been validated in real usage?**  
A: The mathematical model is complete and reproducible. Real-world empirical validation is in progress. See [TESTING.md](TESTING.md) for current status. We're transparent about this being pre-validation phase.

**Q: Does response quality decrease?**  
A: Theoretically, no—memory preserves decisions while removing bloat. This needs empirical confirmation through user testing.

**Q: How much can I realistically save?**  
A: Based on mathematical modeling, we estimate 3-8× capacity improvement depending on workflow. Real-world validation is in progress - we need beta testers to confirm these estimates.

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

## Ready to 8× your capacity?

```bash
# Install in 30 seconds
curl -fsSL https://raw.githubusercontent.com/nadiradzedavit/claude-frugal/main/install.sh | bash

# Verify
python3 demo/token-calculator.py --all

# Start building 🚀
claude
```

---

**Stop hitting rate limits. Start building at scale.**

---

<p align="center">
  <strong>Claude Frugal: Professional efficiency for professional developers</strong>
  <br><br>
  <a href="https://github.com/nadiradzedavit/claude-frugal">GitHub</a> •
  <a href="https://github.com/nadiradzedavit/claude-frugal/issues">Issues</a> •
  <a href="QUICK_REFERENCE.md">Quick Reference</a> •
  <a href="EXAMPLES.md">Examples</a>
</p>
