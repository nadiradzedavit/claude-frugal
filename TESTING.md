# Claude-Frugal Testing & Validation Framework

## Project Status

**Current Phase**: Pre-validation (v1.0.x)  
**Testing Status**: ⚠️ Requires empirical validation  
**Grant Readiness**: 🟡 Pending real-world testing

---

## Overview

Claude-Frugal makes bold claims about token efficiency (97% savings, 8.8× capacity multiplier). This document outlines how we validate these claims and what testing remains to be completed.

---

## Testing Methodology

### 1. Token Calculation Validation

**Mathematical Model** (`demo/token-calculator.py`):
- Based on estimation formulas
- Conservative assumptions
- Reproducible calculations

**Validation Approach**:
```bash
# Run mathematical model
python3 demo/token-calculator.py --all

# Output provides theoretical savings
# Must be validated against real API usage
```

**Confidence Level**:
- Mathematical model: ✅ Complete
- Real API validation: ⚠️ Pending

---

### 2. Real Session Testing Protocol

#### Phase 1: Baseline Measurement (Standard Usage)

```
Objective: Measure token consumption WITHOUT Claude-Frugal skills

Test Session:
1. Start fresh Claude Code Pro session
2. Complete representative task (e.g., REST API development)
3. Track metrics:
   - Total messages sent
   - Files read (full reads)
   - Token usage (from API logs or estimation)
   - Time to rate limit / yellow zone
4. Document experience:
   - When did context feel bloated?
   - When did responses slow?
   - What forced a restart?

Data to Collect:
- Message count before limit
- Estimated token consumption
- Files read count
- Session duration
```

#### Phase 2: Frugal Measurement (With Skills)

```
Objective: Measure token consumption WITH Claude-Frugal skills

Test Session:
1. Start fresh Claude Code Pro session
2. Complete SAME task as baseline
3. Use skills:
   - slim-read for file operations
   - distill when approaching yellow zone
   - limit-watch for monitoring
4. Track same metrics as baseline
5. Document experience:
   - Did skills work as expected?
   - Were token savings noticeable?
   - Did quality suffer?

Data to Collect:
- Message count before limit
- Estimated token consumption
- slim-read operations count
- distill cycles used
- Session duration
```

#### Phase 3: Comparison Analysis

```
Calculate:
- Actual token savings (%)
- Message capacity multiplier (x)
- Quality impact (subjective)
- Usability friction (subjective)

Expected Results:
- Token savings: 80-95%
- Capacity multiplier: 5-10×
- Quality: No degradation
- Usability: Minor overhead

If results differ significantly from claims, update README.
```

---

## Current Test Status

### ✅ Completed

- [x] Mathematical token calculator
- [x] Benchmark scenario definitions (5 scenarios)
- [x] Theoretical framework documentation
- [x] Skill definitions and instructions

### ⚠️ In Progress / Needed

- [ ] **Real API validation** (CRITICAL)
  - Actual Claude Code session with baseline usage
  - Actual Claude Code session with Frugal skills
  - Token count comparison from API logs
  
- [ ] **Skill functionality testing**
  - Does slim-read correctly extract functions?
  - Does distill properly save to memory?
  - Does limit-watch accurately track tokens?
  
- [ ] **Integration testing**
  - Skills work together in workflow?
  - Memory persists across /compact?
  - No conflicts with Claude Code features?
  
- [ ] **User acceptance testing**
  - 3-5 beta testers try the skills
  - Collect feedback on usability
  - Document pain points and fixes

- [ ] **Performance validation**
  - Measure actual response time impact
  - Track false positives (unnecessary slim-reads)
  - Quantify overhead of distillation

---

## How to Contribute Testing Data

### If You've Used Claude-Frugal:

1. **Submit a Test Report** (template below)
2. **Create GitHub Issue**: Use "Test Results" label
3. **Share Metrics**: Token counts, savings achieved
4. **Include Context**: Task type, session length, experience

### Test Report Template

```markdown
## Test Report: [Task Type]

**Date**: YYYY-MM-DD  
**Claude Code Version**: [version]  
**Session Type**: [Baseline / Frugal]

### Setup
- Task Description: [e.g., "Build REST API with auth"]
- Files in Codebase: [count and types]
- Session Goal: [what you wanted to accomplish]

### Metrics
- Messages Sent: [count]
- Files Read: [count]
- Token Usage (estimated): [number]
- Token Usage (API logs): [number if available]
- Session Duration: [minutes]

### Skills Used (Frugal only)
- slim-read: [count] operations
- distill: [count] cycles
- limit-watch: [count] checks

### Experience
- Quality: [1-5 stars + notes]
- Usability: [1-5 stars + notes]
- Token Savings (perceived): [rough %]
- Would Recommend: [Yes/No + why]

### Issues Encountered
[List any bugs, confusion, or friction]

### Comparison to Baseline
[If you've run both, compare the experiences]
```

---

## Validation Confidence Levels

### Current Claims vs. Evidence

| Claim | Confidence | Evidence Status |
|-------|-----------|-----------------|
| 90% file reading savings | 🟡 Medium | Mathematical model only |
| 99% conversation compression | 🟡 Medium | Theoretical, pending memory tests |
| 97% overall savings | 🟡 Medium | Derived from above |
| 8.8× capacity multiplier | 🟡 Medium | Based on 40 msg baseline assumption |
| No quality degradation | 🔴 Low | Not tested |
| Works with all languages | 🔴 Low | Assumes grep patterns work |

**Legend**:
- 🟢 High: Empirically validated with multiple sessions
- 🟡 Medium: Theoretically sound, needs real-world confirmation
- 🔴 Low: Assumption or untested claim

---

## Testing Roadmap

### Immediate (Before Grant Submission)

1. ✅ Create this testing framework
2. ⏳ Run 5+ real Claude Code sessions with skills
3. ⏳ Document actual token savings from API
4. ⏳ Update README with validated claims
5. ⏳ Add confidence intervals to all metrics

### Short-term (Next 2-4 weeks)

1. ⏳ Recruit 5-10 beta testers
2. ⏳ Collect standardized test reports
3. ⏳ Analyze variance in results
4. ⏳ Fix bugs discovered in testing
5. ⏳ Create demo video with real session

### Medium-term (Next 2-3 months)

1. ⏳ A/B testing framework (baseline vs. frugal)
2. ⏳ Automated token tracking script
3. ⏳ Statistical analysis of savings
4. ⏳ Publication-quality benchmarks
5. ⏳ Case studies from diverse users

---

## FAQ: Testing & Validation

**Q: Why aren't there real test results yet?**  
A: This is an early-stage project. The mathematical model is complete and the skills are defined, but empirical validation requires extensive real-world usage. We're transparent about this limitation.

**Q: How can I trust the 97% savings claim?**  
A: Currently, you should treat it as a theoretical estimate. Run `python3 demo/token-calculator.py --all` yourself to see the math. Real validation is in progress.

**Q: Can I help validate these claims?**  
A: Yes! Install the skills, use them in real sessions, and submit a test report (template above). Your data will help establish ground truth.

**Q: What if real results don't match the claims?**  
A: We'll update the README with honest, validated numbers. This project values accuracy over marketing.

**Q: Why publish before validation?**  
A: To gather community feedback and recruit testers. The skills are usable and theoretically sound, but we're transparent that empirical proof is pending.

---

## Testing Tools

### Token Estimation Script

```bash
# Estimate tokens in a conversation
python3 demo/token-calculator.py --custom \
  --files 20 \
  --messages 60 \
  --distillations 2
```

### Session Recording Template

```bash
# Start a test session with logging
export CLAUDE_FRUGAL_TEST=1
export CLAUDE_FRUGAL_LOG="session-$(date +%Y%m%d-%H%M%S).log"

# Use Claude Code normally
# Document every slim-read, distill, limit-watch invocation
# Save final report to testing-results/
```

### Comparison Script (Future)

```python
# Compare baseline vs frugal sessions
python3 testing/compare_sessions.py \
  --baseline session-baseline.json \
  --frugal session-frugal.json \
  --output comparison-report.md
```

---

## Contact for Testing

- **GitHub Issues**: [Report bugs or share results](https://github.com/nadiradzedavit/claude-frugal/issues)
- **Discussions**: [Share experiences](https://github.com/nadiradzedavit/claude-frugal/discussions)
- **Email**: [For sensitive test data]

---

## Version History

- **v1.0.0** (2026-05-03): Initial release with mathematical model
- **v1.0.1** (2026-05-03): Bug fixes and documentation improvements
- **v1.1.0** (TBD): First release with validated real-world metrics

---

## Conclusion

**Current Status**: Claude-Frugal is a theoretically sound, mathematically validated approach to token efficiency. Real-world validation is the next critical step.

**How You Can Help**: Use the skills, document your experience, share your data. Collective validation will establish the true effectiveness of this approach.

**Transparency Commitment**: All test results, positive or negative, will be documented and reflected in project claims.

---

**Last Updated**: 2026-05-04  
**Validation Status**: Pre-empirical (mathematical model complete, real-world testing in progress)
