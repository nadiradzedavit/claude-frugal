# Skill Template for Claude-Frugal

Use this template to create new efficiency skills for Claude Code.

---

## Skill File: `your-skill-name.md`

```markdown
---
name: your-skill-name
description: One-line description of what this skill does and when to use it
author: Your Name (@yourhandle)
version: 1.0.0
tags: [efficiency, category, use-case]
estimated_savings: XX%
---

# Your Skill Name

## Purpose
Brief paragraph explaining what inefficiency this skill addresses and how it helps.

## When to Use
- Bullet point scenario 1
- Bullet point scenario 2
- Bullet point scenario 3

## How It Works
Step-by-step explanation of the skill's logic:
1. First step
2. Second step
3. Third step

## Instructions for Claude

When the user requests this skill (e.g., "use [skill-name] to..."), follow these steps:

### Step 1: [First Action]
[Detailed instructions for what Claude should do]

Example:
```
User: "Use [skill] on auth.py"
Claude: [What Claude should analyze/do]
```

### Step 2: [Second Action]
[Detailed instructions]

### Step 3: [Output Format]
[How Claude should present results]

Example output:
```
📊 Skill Name Results:
  • Metric 1: value
  • Metric 2: value
  • Token savings: XXXX

💡 Recommendation: [next steps]
```

## Token Savings Calculation

**Standard approach**: [tokens used]  
**With this skill**: [tokens used]  
**Savings**: XX% ([specific number] tokens)

## Edge Cases & Limitations

- **Limitation 1**: [description]
- **Limitation 2**: [description]

## Examples

### Example 1: [Use Case]
```
User: "Use [skill] for [specific task]"

Claude: [Step-by-step execution]

Result: Saved XXXX tokens (XX% reduction)
```

### Example 2: [Use Case]
```
User: "[Alternative phrasing]"

Claude: [Execution]

Result: [Outcome]
```

## Integration with Other Skills

- **Works well with**: skill-A, skill-B
- **Use before**: skill-C (preparation)
- **Use after**: skill-D (follow-up)

## Success Metrics

Track effectiveness:
- Average token savings: __%
- User satisfaction: [feedback mechanism]
- Common use cases: [list]

## Changelog

### v1.0.0 (YYYY-MM-DD)
- Initial release
- Core functionality implemented
- Tested on [platform/workflow]

---

## Testing Checklist

Before submitting your skill:

- [ ] Tested with Claude Code locally
- [ ] Verified token savings with real examples
- [ ] Documented at least 2 use cases
- [ ] No syntax errors in frontmatter
- [ ] Clear instructions for Claude
- [ ] Edge cases documented
- [ ] Examples include expected output

## Submission

1. Fork the repository
2. Create skill file in `.claude/skills/your-skill-name.md`
3. Add documentation to `docs/skills/your-skill-name.md`
4. Update `CHANGELOG.md`
5. Create pull request with:
   - Description of skill purpose
   - Token savings benchmarks
   - Testing evidence (screenshots/logs)
   - Use case explanation

## Questions?

- Open an issue: github.com/[repo]/issues
- Ask in Discord: [discord-link]
- Check existing skills for reference

---

**Happy skill building! Every efficiency improvement helps the entire community.**
```

---

## Naming Conventions

### Skill File Names
- Use lowercase with hyphens: `token-saver.md`
- Be descriptive: `multi-file-diff.md` not `mfd.md`
- Avoid abbreviations unless widely known

### Skill Frontmatter
```yaml
name: exact-file-name-without-extension
description: Max 100 chars, focuses on user benefit
author: Real name or @handle (for credit)
version: Semantic versioning (1.0.0)
tags: [2-4 relevant tags]
estimated_savings: Conservative percentage
```

### Tag Categories
- **efficiency**: All skills (default)
- **reading**: File/code reading optimizations
- **writing**: Code generation optimizations
- **context**: Context/memory management
- **analysis**: Code analysis and review
- **debugging**: Debugging workflows
- **testing**: Test-related optimizations
- **refactoring**: Refactoring workflows
- **documentation**: Docs-related tasks

---

## Token Savings Estimation

### Calculation Method
```python
standard_tokens = [baseline measurement]
skill_tokens = [with your skill]
savings_pct = ((standard - skill) / standard) * 100

# Be conservative - round down
estimated_savings = floor(savings_pct)
```

### Benchmarking
Test on at least 3 scenarios:
1. Small example (1-2 files, simple task)
2. Medium example (5-10 files, typical task)
3. Large example (20+ files, complex task)

Report the **average** or **median** savings.

---

## Documentation Requirements

### Minimum Viable Skill
- ✅ Clear purpose statement
- ✅ 2+ usage examples
- ✅ Token savings estimate
- ✅ Integration with existing skills

### Excellent Skill
- ✅ All of above, plus:
- ✅ 5+ detailed examples
- ✅ Comparison charts (before/after)
- ✅ Edge case handling
- ✅ Video demo or GIF
- ✅ Real user testimonials

---

## Inspiration: Existing Skills

### Study These for Reference
1. **slim-read** - File reading optimization
   - Clear structure: overview → instructions → examples
   - Multiple invocation styles
   - Strong error handling

2. **distill** - Context compression
   - Integration with memory system
   - Clear output format
   - Actionable next steps

3. **limit-watch** - Monitoring
   - Visual feedback (zones)
   - Proactive recommendations
   - Configurable thresholds

---

## Anti-Patterns to Avoid

### ❌ Don't:
- Create skills that require external dependencies (unless in Phase 2)
- Make instructions ambiguous or too general
- Forget to document edge cases
- Over-promise on token savings
- Duplicate existing skill functionality
- Create skills for single-use scenarios

### ✅ Do:
- Focus on repeatable workflows
- Provide concrete examples
- Test thoroughly before submitting
- Document limitations honestly
- Integrate with existing ecosystem
- Consider diverse use cases

---

## Community Skill Ideas (Starter Pack)

Need inspiration? Try building:

### 1. **test-focus**
Read only failing tests + their implementations

**Savings**: 80% in test debugging workflows

### 2. **type-map**
Show TypeScript/Python type hierarchy without implementations

**Savings**: 85% in type system navigation

### 3. **git-context**
Read only files changed in current branch

**Savings**: 90% in PR review workflows

### 4. **dependency-trace**
Show import/dependency tree without file contents

**Savings**: 75% in architecture understanding

### 5. **error-hunt**
Read files containing specific error message

**Savings**: 80% in error debugging

### 6. **doc-scan**
Extract all docstrings/comments without code

**Savings**: 90% in documentation review

### 7. **config-compare**
Diff configuration files across environments

**Savings**: 70% in config debugging

### 8. **api-surface**
Show public API surface (exports, endpoints) only

**Savings**: 85% in API documentation

### 9. **quick-checkpoint**
Lightweight context save without full distill

**Savings**: 50 tokens vs. carrying context

### 10. **message-compress**
Compress last N messages without full distillation

**Savings**: 60% for mid-session cleanup

---

## Getting Help

### Before Asking:
1. Read existing skill documentation
2. Test your skill locally
3. Search issues for similar questions

### Where to Ask:
- **Technical questions**: GitHub Issues
- **Design feedback**: Discord #skill-development
- **Quick questions**: Discord #help
- **Feature proposals**: GitHub Discussions

### Response Time:
- Critical bugs: 24 hours
- Questions: 2-3 days
- Feature requests: Weekly triage

---

## Recognition

Great skills get:
- 🌟 Featured in README
- 📢 Shoutout on social media
- 🏆 Efficiency Champion badge (monthly)
- 📊 Stats on community dashboard
- ✍️ Blog post case study (quarterly)

**Your contribution helps thousands of developers. Thank you!**
