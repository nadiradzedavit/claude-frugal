# Contributing to Claude-Frugal

We welcome contributions from the community! This project succeeds when developers share their efficiency hacks.

## Ways to Contribute

### 1. Share Your Efficiency Skill

Have a technique that saves tokens? Turn it into a skill!

**Skill Template:**
```markdown
---
skill: your-skill-name
description: Brief description (50 chars max)
args:
  param_name:
    type: string|number|boolean
    description: What this parameter does
    required: true|false
    default: value
---

# Your Skill Name

Brief overview of what the skill does and why it matters for Pro users.

## Instructions

1. Step-by-step instructions for Claude to follow
2. Be specific and actionable
3. Include error handling

## Token Savings

Explain the efficiency impact:
- Before: X tokens
- After: Y tokens
- Savings: Z%

## Best Practices

When to use this skill vs alternatives.
```

### 2. Report Efficiency Metrics

Found a workflow that delivers exceptional savings? Share your data:
- Token counts before/after
- Task completed
- Time saved
- Rate limit impact

Submit via GitHub Issues with tag `efficiency-report`.

### 3. Improve Documentation

- Fix typos or unclear instructions
- Add examples from real-world usage
- Translate docs to other languages
- Create video tutorials

### 4. Test Across Platforms

Help us validate skills work across:
- Different operating systems
- Various project types (web, mobile, data science, etc.)
- Multiple Claude Code versions

## Contribution Process

1. **Fork the repository**
   ```bash
   gh repo fork yourusername/claude-frugal
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-skill-name
   ```

3. **Add your skill or improvement**
   ```bash
   # Add skill
   touch .claude/skills/your-skill.md
   
   # Or edit existing files
   ```

4. **Test thoroughly**
   - Install skill in your Claude Code environment
   - Run through complete workflow
   - Measure token savings
   - Document any edge cases

5. **Submit pull request**
   ```bash
   git add .
   git commit -m "Add [skill-name] for [use-case]"
   git push origin feature/your-skill-name
   gh pr create
   ```

## Skill Quality Standards

For a skill to be merged, it must:

✅ **Save meaningful tokens** (>20% improvement in target scenario)  
✅ **Include clear instructions** (Claude can execute without ambiguity)  
✅ **Document savings metrics** (before/after token counts)  
✅ **Handle edge cases** (file not found, invalid input, etc.)  
✅ **Follow naming conventions** (kebab-case, descriptive)  
✅ **Include usage examples** (at least 2 realistic scenarios)

## Community Guidelines

- **Be welcoming**: Remember, we're all here to make Claude Code more accessible
- **Share generously**: Your efficiency hack could help developers in 50+ countries
- **Test rigorously**: Broken skills waste more tokens than they save
- **Document clearly**: Future users should understand your skill in 60 seconds
- **Measure honestly**: Report real savings, not theoretical maximums

## Recognition

Contributors will be featured in:
- README.md credits section
- Monthly efficiency leaderboard
- Community showcase

Top contributors (by token savings impact) get:
- Co-maintainer status
- Early access to experimental features
- Shoutout in grant reports

## Questions?

- **GitHub Issues**: For bugs, feature requests, or questions
- **Discussions**: For workflow ideas and optimization strategies
- **Discord** (coming soon): For real-time help

## License

By contributing, you agree your contributions will be licensed under MIT License.

---

**Let's make Claude Code accessible to every developer, regardless of budget.**
