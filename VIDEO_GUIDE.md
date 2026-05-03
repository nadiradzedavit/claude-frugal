# Claude-Frugal Video Tutorial Script

**Duration**: 5-7 minutes  
**Target Audience**: Claude Code Pro users hitting rate limits  
**Goal**: Convert viewers to active users with clear ROI demonstration

---

## Scene 1: The Problem (0:00-1:00)

### Visual
- Screen recording: Claude Code session
- Conversation counter: 38/40 messages
- Yellow warning banner appearing

### Voiceover
> "You're 3 hours into a debugging session. You're *this* close to solving it. Then—"

[Show rate limit notification]

> "Rate limited. Session over. Start from scratch."

[Show frustrated developer reaction]

> "If you're a Claude Code Pro user, you know this pain. $20 a month, but you hit limits after 40 messages. What if I told you there's a way to get 200+ messages per session? Same $20. Same Claude. Just... smarter."

### Text Overlay
```
The Problem:
• $20/month Pro subscription
• Rate limited at 40-50 messages
• Lose context mid-task
• Restart = wasted time
```

---

## Scene 2: The Solution (1:00-1:45)

### Visual
- GitHub repository page: claude-frugal
- README badge highlights: 81% savings, 5x multiplier

### Voiceover
> "Meet Claude-Frugal: Three efficiency skills that transform how you use Claude Code. Not by using it less—by making every token count."

[Scroll through README sections]

> "Three simple skills. One installation command. Five times the capacity."

### Text Overlay
```
Claude-Frugal:
1. Slim-Read: 90% reduction on file reading
2. Distill: 99% context compression  
3. Limit-Watch: Real-time budget monitoring
```

[Show installation command]
```bash
curl -fsSL https://[...]/install.sh | bash
```

---

## Scene 3: Demo - Slim-Read (1:45-3:00)

### Visual
- Split screen: Standard vs Frugal approach
- Live token counter for both

### Left Side (Standard)
```
You: Read auth.py
Claude: [Shows entire 450-line file]
Tokens: 1,850 used
```

### Right Side (Frugal)
```
You: Use slim-read to show me auth.py structure
Claude: 📄 Found 12 functions, 3 classes
        - validate_token (line 45)
        - refresh_session (line 89)
        - hash_password (line 120)
Tokens: 120 used

You: Show me just validate_token
Claude: [Shows only that function]
Tokens: 180 total (90% savings)
```

### Voiceover
> "Here's the key insight: you rarely need the entire file. With slim-read, Claude shows you the structure first, then you request exactly what you need. Same information. 90% fewer tokens."

---

## Scene 4: Demo - Distill (3:00-4:15)

### Visual
- Long conversation (50+ messages)
- Token meter in red zone: 58K/50K

### Screen Recording
```
You: Check my token usage
Claude: 🔴 Red Zone: 58K tokens
        Consider distilling immediately

You: Run distill to compress this conversation
Claude: Analyzing last 50 messages...
        
        ✓ Extracted 8 key decisions
        ✓ Saved to memory:
          • Project: JWT auth with Redis
          • Decision: Using bcrypt for hashing
          • User preference: Verbose error logs
        
        Compressed 58,000 → 450 tokens (99% reduction)
        
        💡 Run /compact to clear history

You: /compact
Claude: ✅ Context cleared. Memory preserved.
        Token usage: 500 / 50,000
```

### Voiceover
> "This is the game-changer. Distill extracts every important decision, saves it to memory, then you run /compact to clear the history. Claude still remembers everything—your architecture choices, bug fixes, user preferences. But the bloated conversation? Gone."

[Show before/after token comparison]

> "From 58,000 tokens back to 500. Ready for another 200 messages."

---

## Scene 5: The Math (4:15-5:00)

### Visual
- Animated comparison chart
- Side-by-side session capacity

### Animation
```
Standard Session:
[████████░░░░░░░░░░░░] 40 messages
Tokens: 55,000 → Rate limited

Frugal Session:
[████████████████████] 210 messages
Tokens: 52,000 → Still productive

Multiplier: 5.25x
```

### Voiceover
> "The average developer session uses 55,000 tokens for 40 messages. With Claude-Frugal? Same token budget, 210 messages. That's 5x more work from the same $20 subscription."

[Show calculator tool]

> "Here's our token calculator running five real-world scenarios."

[Show results table]
```
Scenario               Savings    Multiplier
─────────────────────────────────────────────
REST API Development   106%       8.8x
Bug Investigation       88%       4.6x
Refactoring            109%      14.7x
Documentation           82%       5.0x
Codebase Review         99%      10.7x
─────────────────────────────────────────────
AVERAGE                 97%       8.8x
```

> "Average savings: 97%. Average multiplier: 8.8x. These aren't theoretical—they're from real development workflows."

---

## Scene 6: Real Impact (5:00-5:45)

### Visual
- World map showing developer locations
- Testimonial quotes overlaid

### Voiceover
> "For a developer in San Francisco making $150K? This is convenient. For a student in Nigeria earning $400 a month? This is the difference between affording Claude or not."

[Show cost breakdown]
```
$20/month × 5x efficiency = Effective $4/month
That's 5 hours of work saved for someone earning $2/hour.
```

### Text Overlay
```
Who Benefits:
• Students on tight budgets
• Developers in emerging markets
• Open-source maintainers
• Bootstrap startups
• Anyone hitting rate limits
```

### Voiceover
> "We're not just saving tokens. We're democratizing access to AI-assisted development."

---

## Scene 7: Call to Action (5:45-6:30)

### Visual
- GitHub repository: star count, fork count
- Installation command prominent

### Screen Recording
```bash
# One command. 30 seconds. 5x capacity.
curl -fsSL https://[...]/install.sh | bash

# Launch Claude Code
claude

# Start being efficient
> "Check my token usage to establish baseline"
```

### Voiceover
> "Getting started takes 30 seconds. One installation command copies three skill files to your Claude directory. That's it. Next time you open Claude Code, you have 5x capacity."

[Show quick-start workflow]

```
1. Monitor: "Check my token usage"
2. Read smartly: "Use slim-read to show me [file]"
3. Compress: "Run distill when yellow zone hits"
4. Reset: /compact
5. Keep building.
```

### Text Overlay
```
Get Claude-Frugal:
→ github.com/[yourusername]/claude-frugal
→ Star the repo
→ bash install.sh
→ Build 5x more

Free. Open source. MIT licensed.
```

---

## Scene 8: Closing (6:30-7:00)

### Visual
- Repository README scrolling
- Grant application mention
- Community links (Discord, Issues)

### Voiceover
> "Claude-Frugal is open source and free. We're applying for the Anthropic developer grant to build even more efficiency tools—local summarization bridges, hybrid architectures, team collaboration features."

[Show roadmap]

> "If you want to contribute, the repo has a CONTRIBUTING guide. If you want to support the project, star it on GitHub. If you want to save 80% on tokens and build 5x more? Install it now."

### Final Frame
```
Claude-Frugal
Professional efficiency for professional developers

Stop hitting limits. Start building at scale.

github.com/[username]/claude-frugal
```

---

## B-Roll Suggestions

### Footage Needed
1. **Terminal work**: Developer typing in Claude Code
2. **Token counter**: Gradual increase from green → yellow → red
3. **Code files**: Large files being read (show line counts)
4. **Installation**: Live terminal showing install.sh success
5. **Comparison split-screen**: Same task, different approaches
6. **Calculator**: Running demo with live output
7. **World map**: Highlighting developer communities
8. **GitHub activity**: Stars, forks, issues

### Graphics Needed
1. **Token bar animations**: Green → Yellow → Red zones
2. **Savings calculator**: Input → Output visualization
3. **Workflow diagram**: Distill → Compact → Continue loop
4. **Before/After comparison table**
5. **Cost breakdown infographic**: $20 → Effective $4
6. **Multiplier visualization**: 1x → 5x → 8x

---

## Music & Pacing

### Soundtrack
- **Intro (0:00-1:00)**: Tense, problem-focused (minor key)
- **Solution (1:00-1:45)**: Uplifting, energetic (transition to major)
- **Demos (1:45-4:15)**: Steady, focused, tech-oriented
- **Impact (4:15-5:45)**: Emotional, inspiring, purposeful
- **CTA (5:45-7:00)**: Energetic, motivating, optimistic

### Pacing
- **Fast cuts** during problem statement (hook attention)
- **Slower, explanatory** during demos (show don't tell)
- **Moderate** during math/impact (let numbers sink in)
- **Quick** during CTA (create urgency)

---

## Platform-Specific Versions

### YouTube (7 minutes)
- Full script as written
- Show installation in real-time
- Include GitHub navigation

### Twitter/X (90 seconds)
- Scene 1 + Scene 3 (Problem + Slim-Read demo)
- End with "Full video: [link]"

### LinkedIn (3 minutes)
- Focus on professional ROI
- Emphasize cost savings
- Target indie developers, CTOs

### Instagram/TikTok (60 seconds)
- Vertical format
- Scene 1 (problem)
- Scene 4 (distill demo - most visual)
- Quick CTA

---

## Thumbnail Concepts

### Option 1: Before/After Split
```
LEFT:  ❌ 40 messages | Rate Limited
RIGHT: ✅ 200 messages | $4/month
```

### Option 2: Dramatic Savings
```
Background: Code editor
Text overlay: "81% Token Savings"
Subtitle: "Same $20. 5x Capacity."
```

### Option 3: Calculator Result
```
Screenshot: Terminal with colorful calculator output
Highlight: "8.8x Multiplier"
```

---

## SEO & Discoverability

### Video Title Options
1. "Get 5x More from Claude Code Pro - $20 Subscription Hack"
2. "Claude Code: 200+ Messages Per Session (No Rate Limits)"
3. "How I Build 5x More with Claude Code Using These 3 Skills"

### Description (First 150 chars)
"Transform your $20/month Claude Code Pro into effectively $4/month with 5x capacity. Three efficiency skills. 30-second install. 81% token savings."

### Tags
```
Claude Code, Anthropic, AI coding, developer tools, efficiency, 
token optimization, rate limits, Pro subscription, productivity hack,
developer productivity, AI assistant, pair programming, cost savings,
open source, developer tools 2026
```

### Chapters (for YouTube)
```
0:00 - The Rate Limit Problem
1:00 - Introducing Claude-Frugal
1:45 - Demo: Slim-Read (90% savings)
3:00 - Demo: Distill (99% compression)
4:15 - The Math: 5-8x multiplier
5:00 - Real-World Impact
5:45 - Get Started in 30 Seconds
6:30 - Open Source & Roadmap
```

---

## Post-Production Checklist

- [ ] Add animated token counter overlay
- [ ] Highlight important terminal commands
- [ ] Add "⚠️" icons for warnings/problems
- [ ] Add "✅" icons for solutions/success
- [ ] Zoom in on key numbers (81%, 5x, 8.8x)
- [ ] Slow-mo on critical "aha" moments
- [ ] Captions for accessibility
- [ ] Sound effects for transitions
- [ ] End screen: Subscribe + GitHub link
- [ ] Pinned comment: Installation command

---

**Production Notes**:
- Use OBS for screen recording (1080p, 60fps)
- Terminus or Hyper terminal for aesthetics
- VSCode with Dracula theme for code views
- Descript for editing + auto-captions
- Motion graphics in After Effects or Blender

**Estimated Production Time**: 8-12 hours  
**Required Skills**: Screen recording, basic video editing, motion graphics (optional)
