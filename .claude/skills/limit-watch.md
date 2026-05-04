---
skill: limit-watch
description: Track session token usage and warn when approaching efficiency red zone
args:
  threshold:
    type: number
    description: Token count that triggers red zone warning (default 50000)
    default: 50000
  auto_distill:
    type: boolean
    description: Automatically suggest /distill when threshold is reached
    default: true
---

# Limit Watch Skill

Real-time token budget monitoring for Pro users to stay within efficient usage zones.

## How to Invoke

**Natural language triggers**:
- "Check my token usage"
- "What's my current token budget with limit-watch?"
- "Use limit-watch to see where I'm at"

This is a skill, not a slash command. Ask Claude to check your usage naturally.

## Token Budget Zones (Pro Tier)

🟢 **Green Zone** (0-30K tokens)
- Optimal efficiency
- Fast responses
- Full context retention

🟡 **Yellow Zone** (30K-50K tokens)  
- Reduced efficiency
- Consider distilling soon
- Context starting to bloat

🔴 **Red Zone** (50K+ tokens)
- High token consumption
- Slower responses possible
- **ACTION REQUIRED**: Run `/distill` + `/compact`

## Instructions

1. **Initialize Session Tracking**: On skill invocation, create session tracker

2. **Estimate Token Usage**: Calculate accumulated tokens from:
   - User messages (use char count / 4 as rough estimate)
   - Assistant responses (use char count / 4)
   - Tool calls and results (file reads, bash outputs)
   - Code blocks (count actual tokens if possible)

3. **Real-Time Monitoring**: After each exchange, update running total

4. **Warning Triggers**:
   - At 30K tokens: "🟡 Entering Yellow Zone (30K tokens). Consider /distill in next 10-15 messages."
   - At 50K tokens: "🔴 RED ZONE REACHED (50K tokens). Run /distill now to extract insights, then /compact to reset."
   - At 75K tokens: "⚠️ CRITICAL: 75K tokens used. Context bloat affecting efficiency. Immediate action required."

5. **Display Status**: Show compact status in output:
   ```
   📊 Token Budget: [████████░░] 45.2K / 50K (Yellow Zone)
   💡 Suggestion: 8 messages until recommended distill point
   ```

6. **Efficiency Metrics**: Track and display:
   - Tokens per task completed
   - Average tokens per message
   - Distill cycles used this session
   - Estimated tokens saved via slim-read

## Usage Patterns

### Manual Check
```
User: /limit-watch
Claude: 📊 Session Status
        
        Tokens Used: 32,450
        Zone: 🟡 Yellow
        Messages: 38
        Avg per message: 854 tokens
        
        Next checkpoint: 50K (17,550 tokens away)
        Estimated messages remaining: ~20
        
        Efficiency tips:
        - Used slim-read: 3 times (saved ~6K tokens)
        - Consider distilling after next major task
```

### Auto-Monitor Mode
Enable in .claude/settings.json:
```json
{
  "hooks": {
    "after_assistant_response": "claude skill limit-watch --quiet"
  }
}
```

Outputs inline warnings:
```
[🟡 Token budget: 32K/50K - Yellow Zone]
```

### Pro User Best Practices

1. **Start every major task with `/limit-watch`** to baseline
2. **Set personal threshold** based on your usage:
   - Conservative users: 35K threshold
   - Power users: 60K threshold  
3. **Pair with /distill**:
   ```
   /limit-watch
   [if yellow/red]
   /distill
   /compact
   /limit-watch  # verify reset
   ```

## Token Estimation Formula

```
estimated_tokens = (
  (total_chars_user_messages * 0.25) +
  (total_chars_assistant_messages * 0.25) +
  (file_read_lines * 1.5) +
  (bash_output_chars * 0.2)
)
```

More accurate estimation:
- Use `len(message.split())` for word count, multiply by 1.3
- Count code blocks at 1.5x (more tokens per word)
- System messages and tool results at 0.8x

## Integration with Memory System

When limit-watch triggers distill suggestion:
1. Note the current task context
2. Auto-save checkpoint to `.claude/.session_checkpoint.json`:
   ```json
   {
     "timestamp": "2026-05-03T10:30:00Z",
     "tokens_at_checkpoint": 52000,
     "current_task": "Refactoring auth module",
     "files_modified": ["auth.py", "middleware.py"],
     "next_steps": ["Test token refresh", "Update docs"]
   }
   ```
3. After distill+compact, resume from checkpoint

## Emergency Context Recovery

If user hits hard limit:
```
⛔ Context limit reached. Emergency recovery:

1. /distill 100  # Distill last 100 messages
2. Review MEMORY.md to verify capture
3. /compact  # Clear history
4. Reload from: .claude/.session_checkpoint.json

This will lose ~5-10 messages but preserve all decisions.
```
