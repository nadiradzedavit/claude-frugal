---
skill: distill
description: Compress conversation history by extracting key decisions into MEMORY.md
args:
  message_count:
    type: number
    description: Number of recent messages to analyze (default 50)
    default: 50
---

# Distill Skill

This skill analyzes recent conversation history, extracts critical decisions, context, and learnings, then saves them to MEMORY.md for long-term retention.

## Instructions

1. **Analyze Recent History**: Review the last {{message_count}} messages in the conversation
2. **Extract Key Information**:
   - Technical decisions made (architecture, library choices, patterns)
   - Code changes completed (files modified, functions added/changed)
   - Bugs fixed and their root causes
   - User preferences discovered during the session
   - Important context about the project
   - Outstanding tasks or next steps

3. **Categorize by Memory Type**:
   - **Feedback**: User corrections or validated approaches
   - **Project**: Ongoing work, goals, or initiatives
   - **User**: Discovered preferences or working style
   - **Reference**: External resources or documentation locations

4. **Save to Memory**: Write distilled information to appropriate memory files in `/home/pc/.claude/projects/-home-pc-Documents-claude-code-skill/memory/`
   - Use existing memory files if updating known facts
   - Create new memory files for novel information
   - Update MEMORY.md index with new entries

5. **Generate Compact Instruction**: After saving, output:
   ```
   ✅ Distilled {X} key insights from last {N} messages
   
   Saved memories:
   - [memory 1 title]
   - [memory 2 title]
   - [memory 3 title]
   
   💡 Ready to reclaim context space. Run: /compact
   
   This will clear conversation history while preserving all decisions in memory.
   ```

6. **Token Savings Report**: Estimate tokens saved by clearing vs. keeping full history

## Why This Matters for Pro Users

Claude Code Pro ($20/mo) has conversation limits. Long threads consume massive context:
- Average message: 500-1500 tokens
- 50 messages with code: 25K-75K tokens
- One distill cycle can reclaim 50K+ tokens

**Best Practice**: Run `/distill` every 30-50 messages, then `/compact` to reset while keeping intelligence.
