# Hacker News Submission

**When to submit:** Tuesday or Wednesday, 8-10 AM EST (peak HN time)

**CRITICAL:** HN is the hardest community to crack. One shot only - if it doesn't get traction, wait 6 months before resubmitting.

---

## Submission Format

**Title:**
```
Show HN: Claude Frugal – 8.8× more capacity from Claude Code Pro via 97% token reduction
```

**URL:**
```
https://github.com/nadiradzedavit/claude-frugal
```

**Important:** Use "Show HN:" prefix - it's the standard format for launching projects

---

## First Comment (Post Immediately)

**Critical:** Post your comment within 60 seconds of submission. HN readers expect the creator to engage.

```
Author here. I built this after repeatedly hitting Claude Code Pro's rate limits during API development projects.

The core insight: most token waste comes from reading entire files when you only need specific functions, and conversation bloat from preserved but irrelevant context.

Three skills that work together:

1. slim-read - precision file reading (85-95% savings)
   → Read file structure first, then specific functions on demand
   
2. distill - compress history to structured memory (99% reduction)
   → Extract key decisions, discard bloat, enable context reset
   
3. limit-watch - real-time budget monitoring
   → Visual tracking (green/yellow/red zones) before hitting limits

All metrics are reproducible via the included token calculator:
```
python3 demo/token-calculator.py --all
```

Technical details:
- Standard: 63K tokens for REST API dev → 40 messages before limit
- Frugal: 9K tokens for same work → 350+ messages possible
- No external dependencies, pure Claude Code skill system

Target audience: students, emerging market developers, indie builders who need Claude's reasoning but can't afford enterprise pricing.

The token calculation methodology is fully transparent in demo/token-calculator.py. Currently seeking beta testers to validate theoretical model with real-world data.

Applying for Anthropic's OSS grant. Happy to answer questions about the implementation, token math, or usage patterns!
```

---

## HN Engagement Rules

### DO:
✅ Reply to every question within 1 hour
✅ Be technical and honest
✅ Admit limitations ("This is pre-validation, seeking testers")
✅ Engage with skeptics respectfully
✅ Share detailed technical explanations
✅ Thank people for trying it
✅ Accept constructive criticism

### DON'T:
❌ Argue or get defensive
❌ Make unverifiable claims
❌ Use marketing speak ("game-changing", "revolutionary")
❌ Ignore technical criticisms
❌ Resubmit if it doesn't get traction
❌ Ask for upvotes (instant ban)
❌ Use alt accounts (they'll detect it)
❌ Be salesy or promotional

---

## Common HN Questions & Answers

**Q: "How do you know this doesn't reduce quality?"**
> A: Great question. Theoretically, it shouldn't - we're removing conversation bloat and redundant file reads, not core context. But this is exactly why I'm seeking beta testers. The theoretical model shows 97% savings; real-world validation might show ±20% variance. I want empirical data.

**Q: "Why not just use Claude's built-in memory?"**
> A: These skills complement it. Built-in memory is automatic; distill gives explicit control over what gets compressed and when. Think of it as manual vs automatic transmission - sometimes you want fine-grained control.

**Q: "This seems too good to be true"**
> A: I understand the skepticism. That's exactly why I made all formulas open source and reproducible. Run `python3 demo/token-calculator.py --all` yourself. Every calculation is transparent. I'm also actively seeking beta testers to validate (or debunk) the model with real data.

**Q: "What about the API costs?"**
> A: This is specifically for Claude Code Pro ($20/month flat fee), not API usage. It extends the message limit within that subscription, so the cost structure is different from pay-per-token API usage.

**Q: "Have you tested this in production?"**
> A: I've used it in my own projects with good results, but I'm one data point. That's why the project status clearly states "pre-validation phase" - I need community validation. The theoretical model is sound, but real-world usage will reveal edge cases and refinements.

**Q: "Why Python for the calculator?"**
> A: Simplicity and reproducibility. Anyone can run `python3 token-calculator.py` and verify the math without installing dependencies. The calculator itself is ~200 lines of transparent formulas.

**Q: "What if Anthropic changes their rate limits?"**
> A: The efficiency patterns (precision reading, context compression) remain valuable regardless of specific limits. The multipliers would adjust, but the core value proposition - doing more with less - stays constant.

---

## If It Gets Flagged

**HN sometimes flags new submissions as spam. If this happens:**

1. **Don't panic** - it happens to legit projects
2. **Email HN mods**: hn@ycombinator.com with subject "Show HN submission flagged"
3. **Be polite**: "Hi, my Show HN submission about Claude Frugal was flagged. Could you review? It's a legitimate open source project. Thanks!"
4. **Wait** - they usually respond within a few hours

**Don't:**
- Resubmit (makes it worse)
- Complain publicly
- Create new accounts

---

## If It Reaches Front Page

**Congratulations! Now the real work begins:**

1. **Stay online for 4-6 hours** - HN front page is intense
2. **Reply to EVERY comment** - even negative ones
3. **Be humble** - "Thanks for trying it!" not "I told you so!"
4. **Share updates** - "Just merged a PR fixing the issue you mentioned"
5. **Note feature requests** - create GitHub issues for good ideas
6. **Thank the community** - post a follow-up comment after 2 hours

**Example follow-up comment:**
> Author here again - blown away by the response! 
> 
> Quick updates based on feedback:
> - Created issue #1 for [top feature request]
> - Clarified [common confusion] in README
> - Added 5 beta testers so far
> 
> Keep the feedback coming. This community is incredibly helpful in refining the project. Thank you!

---

## If It Doesn't Get Traction

**It happens to most Show HN posts. Don't take it personally.**

**Possible reasons:**
- Bad timing (US holiday, major news event)
- Title wasn't clear enough
- Submitted during low-traffic period
- Just luck of the draw

**What to do:**
1. **Wait 6 months** - don't resubmit earlier
2. **Build in the meantime** - get real users, testimonials, case studies
3. **Improve the project** - make it undeniably better
4. **Try again** with better timing and refined pitch

**What NOT to do:**
- Resubmit immediately (ban risk)
- Blame HN community
- Give up on the project

---

## Post-HN Actions

**If successful:**
1. Add "Featured on Hacker News" to README
2. Create a "HN Discussion" link in docs
3. Thank commenters who contributed ideas
4. Turn feedback into GitHub issues

**Either way:**
1. Archive the discussion for future reference
2. Note what worked/didn't work
3. Apply learnings to other platforms
4. Keep building

---

## Success Metrics

**Great outcome:**
- 50+ points
- Front page for 2+ hours
- 10+ GitHub stars from HN traffic
- Substantive technical discussion

**Good outcome:**
- 20+ points
- Meaningful feedback
- 5+ stars
- Some beta testers

**Okay outcome:**
- Didn't get traction but got useful feedback
- No negative backlash
- 1-2 stars

**Learn from any outcome!**

---

## Final Checklist Before Submitting

- [ ] Repository is polished (no obvious bugs)
- [ ] README is clear and professional
- [ ] Token calculator runs without errors
- [ ] You have 4+ hours free to engage
- [ ] It's Tuesday or Wednesday, 8-10 AM EST
- [ ] You've read HN guidelines: https://news.ycombinator.com/newsguidelines.html
- [ ] First comment is ready to paste
- [ ] You're prepared for both success and crickets
- [ ] You're ready to be humble and learn

**Remember:** HN values substance over hype. Be genuine, be technical, be helpful.

Good luck! 🚀
