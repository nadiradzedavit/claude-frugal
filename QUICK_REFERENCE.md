# Claude-Frugal Quick Reference

**One-page cheat sheet for efficiency skills**

## ⚠️ CRITICAL: Skills Are NOT Slash Commands

**DON'T type:** `/distill` or `/slim-read`  
**DO ask naturally:** "Run distill" or "Use slim-read on auth.py"

Skills are instruction files that Claude follows when you mention them. They're triggered by **natural language**, not slash commands.

**The ONLY slash command you'll use:** `/compact` (built-in Claude Code command)

---

## The Three Core Skills

### 🗜️ `distill` - Context Compression
**What**: Compress conversation into permanent memory  
**When**: Yellow zone (30K+ tokens) or after major task  
**Saves**: 40-60K tokens per cycle  
**Follow with**: `/compact` to clear history

**How to use:**
```
"Run distill to compress this conversation"
"Compress the last 100 messages"
```

---

### 🎯 `slim-read` - Precision File Reading
**What**: Read only specific function/class from file  
**When**: You know what you need from a large file  
**Saves**: 80-95% per file operation

**How to use:**
```
"Use slim-read to show me the structure of auth.py"
"Read the validate_token function with slim-read"
"Slim-read lines 50-75 of config.py"
```

---

### 📊 `limit-watch` - Token Budget Monitor
**What**: Monitor session token usage  
**When**: Start of session, before major tasks  
**Prevents**: Context bloat, surprise rate limits

**How to use:**
```
"Check my token usage with limit-watch"
"What's my token budget?"
"Use limit-watch with a 35000 token threshold"
```

---

## Token Budget Zones

| Zone | Range | Status | Action |
|------|-------|--------|--------|
| 🟢 Green | 0-30K | Optimal | Code freely |
| 🟡 Yellow | 30-50K | Caution | Plan to distill |
| 🔴 Red | 50K+ | Critical | Distill NOW |

---

## The Core Workflow Loop

```
1. "Check my token usage"              → Get baseline
2. Code 30-40 messages                 → Ask for slim-read when needed
3. Watch for yellow zone               → Claude warns automatically
4. "Run distill"                       → Compress conversation
5. /compact                            → Reset (ONLY slash command)
6. Repeat
```

---

## Common Scenarios

### Starting a New Session
```
You: "Check my token usage to get a baseline"
Claude: [Shows 0 tokens, green zone]
You: "Let's build X feature"
```

### Reading Large Files
```
# Instead of: "Read components/Header.tsx"
You: "Use slim-read to show me the structure of Header.tsx"
Claude: [Shows function map]

You: "Now show me just the renderMenu function with slim-read"
Claude: [Extracts only that function]
```

### Mid-Session Check
```
You: "What's my token usage?"
Claude: [Shows current status]
# If yellow: finish current task, then distill
# If green: keep coding
```

### Before Rate Limit
```
Claude: 🟡 Yellow Zone warning
You: [Complete current task]
You: "Run distill to compress our conversation"
Claude: [Extracts insights, saves to memory]
You: /compact
You: "Check token usage"
Claude: [Shows green zone - reset successful]
```

### Switching Tasks
```
You: [Finish feature A]
You: "Run distill to save our decisions"
You: /compact
You: "Let's work on feature B"
     [Claude remembers via memory]
```

---

## Keyboard Shortcuts (if configured)

```
Ctrl+L  →  /limit-watch
Ctrl+D  →  /distill
Ctrl+R  →  /slim-read [prompted for file]
```

*Configure in ~/.claude/keybindings.json*

---

## Token Savings Quick Math

| Operation | Standard | Slim-Read | Savings |
|-----------|----------|-----------|---------|
| Read 500-line file | 2000 tokens | 200 tokens | 90% |
| Read 10 files | 20000 tokens | 2000 tokens | 90% |
| 50 message history | 60000 tokens | 500 tokens* | 99% |

*After distill + compact

---

## Troubleshooting

### "I distilled but Claude forgot context"
- Check: `.claude/projects/.../memory/MEMORY.md` exists
- Memory loads automatically next message
- Try: Explicitly reference decision ("As we decided in memory...")

### "Slim-read not finding function"
- Try: `/slim-read file.py` first (see map)
- Check: Function name matches exactly (case-sensitive)
- Alternative: Use line range `/slim-read file.py 100-150`

### "Still hitting rate limits"
- Check: Are you distilling regularly? (every 30-40 msgs)
- Try: Lower threshold `/limit-watch --threshold 35000`
- Review: Are you using slim-read for large files?

### "Distill seems slow"
- Normal: Analyzing 50+ messages takes 10-15 seconds
- Future: Local bridge will offload this (free)

---

## Pro Tips

### 1. Distill at Natural Breakpoints
✅ Feature complete  
✅ Bug fixed  
✅ Major refactor done  
❌ Every 5 messages (too frequent)

### 2. Combine Skills
```
/limit-watch                        # Check status
/slim-read api.py                  # See functions
/slim-read api.py authenticate     # Read specific one
[work for a while]
/limit-watch                        # Check again
/distill                            # If yellow/red
```

### 3. Memory > Repeating Yourself
If you keep telling Claude the same architecture decisions:
- That's a memory problem
- Use `/distill` to capture it permanently
- Claude will remember across sessions

### 4. Aggressive Distillation
For maximum efficiency:
- Distill at 25K (yellow zone entry)
- Use slim-read for ALL files >200 lines
- Result: 8-10x capacity vs standard workflow

### 5. Emergency Recovery
Hit hard limit mid-task?
```
/distill 100  # Capture as much as possible
[Review .claude/.session_checkpoint.json]
/compact
[Resume from notes]
```

---

## Efficiency Metrics to Track

Personal benchmarks:
- Messages per session (before vs after)
- Average tokens per message
- Distill cycles per project
- Rate limit frequency

Share yours in GitHub Discussions!

---

## Remember

**The goal isn't to use Claude less—it's to accomplish MORE within your Pro tier limits.**

Every token saved on reading files is a token available for writing features.

---

## Next Steps

1. Install skills: `cp -r .claude/skills/* ~/.claude/skills/`
2. Start session: `claude`
3. Run: `/limit-watch`
4. Code smarter: Use `/slim-read` instead of full reads
5. Stay efficient: `/distill` before yellow zone
6. Share results: github.com/yourname/claude-frugal/discussions

---

**Print this page. Pin it to your wall. 5x your Pro subscription.**
