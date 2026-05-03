# Claude-Frugal Quick Reference

**One-page cheat sheet for efficiency skills**

## The Three Core Skills

### 🗜️ `/distill [N]`
**What**: Compress conversation into permanent memory  
**When**: Yellow zone (30K+ tokens) or after major task  
**Saves**: 40-60K tokens per cycle  
**Follow with**: `/compact` to clear history

```
/distill           # Last 50 messages (default)
/distill 100       # Last 100 messages (for major milestones)
```

---

### 🎯 `/slim-read <file> [target]`
**What**: Read only specific function/class from file  
**When**: You know what you need from a large file  
**Saves**: 80-95% per file operation

```
/slim-read auth.py                    # Show file map
/slim-read auth.py validate_token     # Read one function
/slim-read auth.py 50-75              # Read line range
```

---

### 📊 `/limit-watch [--threshold N]`
**What**: Monitor session token usage  
**When**: Start of session, before major tasks  
**Prevents**: Context bloat, surprise rate limits

```
/limit-watch                    # Default 50K threshold
/limit-watch --threshold 35000  # Custom threshold
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
1. /limit-watch              (baseline)
2. Code 30-40 messages       (use slim-read)
3. Watch for yellow zone     (auto-warned)
4. /distill                  (compress)
5. /compact                  (reset)
6. Repeat
```

---

## Common Scenarios

### Starting a New Session
```
/limit-watch
"Let's build X feature"
```

### Reading Large Files
```
# Instead of: Read entire file
/slim-read components/Header.tsx    # See function map
/slim-read components/Header.tsx renderMenu
```

### Mid-Session Check
```
/limit-watch
# If yellow: finish current task, then distill
# If green: keep coding
```

### Before Rate Limit
```
🟡 Yellow Zone warning
[Complete current task]
/distill
[Review memory capture]
/compact
/limit-watch  # Verify reset
[Continue coding]
```

### Switching Tasks
```
[Finish feature A]
/distill  # Capture decisions
[Start feature B - Claude remembers via memory]
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
