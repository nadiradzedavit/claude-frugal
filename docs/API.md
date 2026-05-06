# Claude Frugal API Documentation

> **Version**: 1.0.x (Pre-validation)  
> **Last Updated**: 2026-05-06

This document provides detailed technical reference for Claude Frugal skills.

---

## Overview

Claude Frugal provides three efficiency skills for Claude Code:

| Skill | Purpose | Estimated Savings |
|-------|---------|-------------------|
| `slim-read` | Precision file reading | 85-95% per file |
| `distill` | Conversation compression | 99% per cycle |
| `limit-watch` | Token budget monitoring | N/A (monitoring) |

---

## Skill Reference

### slim-read

**Purpose**: Read specific functions, classes, or line ranges instead of entire files.

**Invocation**: Natural language (not a slash command)

```
"Use slim-read to show me the authenticate function in auth.py"
"Slim-read lines 50-100 of config.py"
"Can you slim-read just the UserModel class from models.py?"
```

**Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `file_path` | string | Yes | Path to the file to read |
| `target` | string | No | Function name, class name, or line range |

**Behavior**:

1. **With target specified**: Extracts only the target code block
   - Functions: `def function_name` or `function function_name`
   - Classes: `class ClassName`
   - Range: Lines N-M (e.g., "50-100")

2. **Without target**: Returns a file map showing:
   - All classes with line numbers
   - All functions with line numbers
   - Prompt to request specific target

**Output Format**:
```
📄 {file_path}:{line_start}-{line_end}

[extracted code block]

💾 Saved ~{N} tokens vs full file read
```

**Best Practices**:
- Use when you know the specific function/class needed
- Don't use for initial file exploration (read full file first)
- Don't use for files < 100 lines (minimal benefit)

---

### distill

**Purpose**: Compress conversation history into structured memory.

**Invocation**: Natural language

```
"Run distill to compress this conversation"
"Compress the last 50 messages"
"Use distill with 100 messages"
```

**Parameters**:

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `message_count` | number | No | 50 | Number of recent messages to analyze |

**Behavior**:

1. Analyzes the specified number of recent messages
2. Extracts key decisions, patterns, and insights
3. Categorizes into memory types:
   - `user`: User preferences and working style
   - `feedback`: Guidance on approach (dos and don'ts)
   - `project`: Project-specific facts and decisions
   - `reference`: Pointers to external resources
4. Saves to Claude Code memory system
5. Reports token savings

**Output Format**:
```
✅ Distilled {N} key insights from last {M} messages

Saved memories:
- [Type] {memory title}: {brief description}
- [Type] {memory title}: {brief description}
...

💡 Ready to reclaim context. Run: /compact
```

**After Distilling**:
Run `/compact` (Claude Code built-in command) to clear conversation history while preserving memories.

**Best Practices**:
- Distill at natural breakpoints (feature complete, bug fixed)
- Don't wait until red zone (distill in yellow zone)
- Don't distill after only 5-10 messages (insufficient content)

---

### limit-watch

**Purpose**: Monitor token budget and provide usage alerts.

**Invocation**: Natural language

```
"Check my token usage"
"What's my current token budget?"
"Use limit-watch to see where I'm at"
```

**Parameters**: None

**Behavior**:

1. Estimates current session token usage
2. Calculates tokens from:
   - Messages sent/received
   - File reads
   - Tool calls
3. Returns status with visual indicator

**Output Format**:
```
📊 Token Budget: [████████████░░░░░░░░] {used}K/{limit}K
Status: {zone_emoji} {zone_name}
Recommendation: {action}
```

**Zones**:

| Zone | Range | Emoji | Recommendation |
|------|-------|-------|----------------|
| Green | 0-30K | 🟢 | Continue working |
| Yellow | 30-50K | 🟡 | Plan to distill soon |
| Red | 50K+ | 🔴 | Distill immediately |

**Best Practices**:
- Check at start of session (baseline)
- Check after major operations
- Check before starting new complex task

---

## Token Estimation

### How Tokens Are Calculated

**File Reading**:
```
Standard: file_lines × 4 tokens/line + 50 overhead
Frugal:   (file_lines × 0.1) × 4 tokens/line + 20 overhead
```

**Conversation**:
```
Standard: messages × avg_tokens × 1.3 bloat_factor
Frugal:   messages × avg_tokens - distill_savings + memory_overhead
```

### Estimation Accuracy

These calculations use heuristics and conservative assumptions:
- Token estimation uses ~4 tokens per line (varies by language)
- Actual API usage may differ by ±20%
- Validation pending (see TESTING.md)

---

## Memory System Integration

Claude Frugal integrates with Claude Code's auto memory system.

### Memory Types

| Type | Purpose | Example |
|------|---------|---------|
| `user` | User profile and preferences | "User prefers TypeScript over JavaScript" |
| `feedback` | Guidance on approach | "Don't mock database in integration tests" |
| `project` | Project facts and decisions | "Using JWT with 24h expiry, refresh tokens" |
| `reference` | External resource pointers | "API docs at docs.example.com/api" |

### Memory Persistence

- Memories are stored at `~/.claude/projects/{project}/memory/`
- Memories persist across sessions and `/compact`
- Memories load automatically in future conversations

---

## Error Handling

### Common Errors

**"Skill not found"**
- Skills are invoked via natural language, not slash commands
- Check installation: `ls ~/.claude/skills/`

**"File not found"**
- Verify file path is correct
- Use relative paths from project root

**"Target not found"**
- Function/class name may be misspelled
- Use slim-read without target to see available definitions

### Debugging

Enable verbose output by asking:
```
"Use slim-read on auth.py and show me the grep output"
```

---

## Compatibility

### Claude Code Versions
- Requires Claude Code v1.0+ with skill support
- Works with all Claude model tiers (Opus, Sonnet, Haiku)

### Operating Systems
- Linux: ✅ Fully supported
- macOS: ✅ Fully supported
- Windows (WSL): ⚠️ Should work, not extensively tested

### Programming Languages
slim-read supports all languages with clear function/class definitions:
- Python: `def`, `class`, `async def`
- JavaScript/TypeScript: `function`, `class`, `const X =`, `export`
- Go: `func`, `type`
- Rust: `fn`, `struct`, `impl`
- Java/C#: `class`, `interface`, `void/type method`
- C/C++: Function declarations, `class`, `struct`

---

## Validation Status

| Feature | Confidence | Evidence |
|---------|------------|----------|
| slim-read extraction | 🟡 Medium | Mathematical model |
| distill compression | 🟡 Medium | Theoretical |
| limit-watch accuracy | 🟡 Medium | Estimation heuristics |
| 90%+ file savings | 🟡 Medium | Pending validation |
| 99% conversation compression | 🟡 Medium | Pending validation |

All features require real-world validation. See [TESTING.md](../TESTING.md) for methodology.

---

## Changelog

| Version | Changes |
|---------|---------|
| 1.0.0 | Initial release with three core skills |

---

## See Also

- [README.md](../README.md) - Overview and quick start
- [EXAMPLES.md](../EXAMPLES.md) - Usage examples
- [TESTING.md](../TESTING.md) - Validation methodology
- [CONTRIBUTING.md](../CONTRIBUTING.md) - How to contribute
