# Claude-Frugal: Real-World Examples

> **Validation Status**: These examples illustrate theoretical workflows based on mathematical modeling. Actual token savings and capacity improvements are estimates pending real-world validation. See [TESTING.md](TESTING.md) for validation methodology and how to contribute your own data.

---

## Example 1: Building a REST API

### Traditional Workflow (No Efficiency Skills)

**Session Start**
```
User: Help me build a REST API for a todo app with auth
Claude: [reads entire project structure - 3K tokens]
Claude: [reads example controller - 2K tokens]
Claude: [creates auth.js - 1.5K tokens response]
... 30 more messages ...
Token count: 55K
Status: Yellow zone, responses slowing
```

**Session End: Rate limited after 40 messages, API 60% complete**

---

### Claude-Frugal Workflow

**Session Start with Monitoring**
```
User: /limit-watch
Claude: 📊 Token Budget: 0 / 50K (Green Zone)

User: Help me build a REST API for a todo app with auth
Claude: [uses slim-read on example controller - 200 tokens]
Claude: [creates auth.js]
... 30 messages ...
Claude: 🟡 Token budget: 32K/50K - Yellow Zone
```

**Mid-Session Distill**
```
User: /distill
Claude: ✅ Distilled 12 key insights from last 50 messages

Saved memories:
- Project: Building todo API with JWT auth, PostgreSQL backend
- Feedback: User prefers Express over Fastify for this project
- Reference: Auth patterns follow OWASP guidelines in docs/security.md

💡 Ready to reclaim context. Run: /compact

User: /compact
Claude: Context cleared. Memory preserved.

User: /limit-watch
Claude: 📊 Token Budget: 2K / 50K (Green Zone - reset)
```

**Continue Building**
```
... 40 more messages ...
Claude: [loads memory automatically, remembers JWT approach]
... 40 more messages ...
[Second distill cycle]
... 40 more messages ...
```

**Session End: API 100% complete, tests written, deployed. 120 total messages.**

---

## Example 2: Debugging a Distributed System

### Traditional Workflow

```
User: The payment service is timing out intermittently
Claude: Let me check the payment service
[reads payment-service/index.js - 2K tokens]
[reads payment-service/config.js - 1K tokens]
[reads database/connection.js - 1.5K tokens]
[reads middleware/timeout.js - 1K tokens]
[reads logs from bash - 3K tokens]

User: Check the retry logic too
[reads retry-handler.js - 2K tokens]
[reads circuit-breaker.js - 2K tokens]

... 20 messages deep ...
Token count: 35K
Status: Yellow zone

User: Actually, check if Redis is the bottleneck
Claude: [context limit - starts forgetting earlier findings]
```

**Result: Had to start new conversation, re-explain issue, lost debugging context**

---

### Claude-Frugal Workflow

```
User: /limit-watch
Claude: 📊 Token Budget: 0 / 50K (Green Zone)

User: The payment service is timing out intermittently
Claude: Let me check key components

User: /slim-read payment-service/index.js handlePayment
Claude: 📄 payment-service/index.js:45-78
[shows only handlePayment function - 180 tokens]
💾 Saved ~1820 tokens vs full file read

User: /slim-read payment-service/config.js TIMEOUT_CONFIG
[shows only config object - 120 tokens]

User: /slim-read database/connection.js createPool
[shows only pool creation - 150 tokens]
```

**Mid-Debug Analysis**
```
... 30 messages investigating ...
Claude: 🟡 Token budget: 28K/50K - Yellow Zone

[Found root cause: connection pool exhaustion]

User: /distill
Claude: Saved memories:
- Project: Payment timeout investigation - root cause is pool exhaustion under load
- Feedback: User wants connection pooling to handle 1000 req/sec burst
- Reference: Load test scripts in scripts/performance/

User: /compact
Claude: Context cleared

User: Now implement the fix
Claude: [loads memory, remembers pool exhaustion issue]
[creates fix with proper pool sizing]
```

**Result: Bug found and fixed in one session. Token savings: ~40K**

---

## Example 3: Student Capstone Project

### Scenario
CS student has 30 days to build full-stack app for graduation. Budget: $20 (one month Pro).

### Without Claude-Frugal

**Week 1**: Build backend API (exhausts 40% of monthly quota)  
**Week 2**: Build frontend (exhausts another 40%)  
**Week 3**: Rate limited, forced to slow down  
**Week 4**: Writing docs manually, minimal AI help  

**Result: Basic project completed, wanted more features but out of quota**

---

### With Claude-Frugal

**Week 1**: Build backend API
- Uses `/limit-watch` to monitor usage
- Uses `/slim-read` for reading documentation and examples  
- Distills twice → saves 35K tokens
- **Quota used: 15%**

**Week 2**: Build frontend
- Continues efficient workflow
- Distills twice more
- **Quota used: 15% (30% total)**

**Week 3**: Add advanced features
- Still in green zone due to efficiency
- Implements real-time notifications, admin dashboard
- **Quota used: 20% (50% total)**

**Week 4**: Polish and documentation
- Writes comprehensive docs with Claude's help
- Adds demo data and deployment scripts
- **Quota used: 20% (70% total)**

**Result: Feature-complete project with 30% quota remaining for bug fixes**

**Grade: A (vs projected B without extra features)**

---

## Example 4: Open Source Maintainer

### Scenario
Maintains popular npm package. Gets 20 issues/week. Pro subscription for triage help.

### Without Claude-Frugal

**Monday-Tuesday**: Investigates 5 complex issues with Claude
- Deep dives into codebase for each issue
- Token heavy: 60K tokens used
- **Hit rate limit Tuesday evening**

**Wednesday-Friday**: Rate limited, manually triages remaining 15 issues

**Weekend**: Quota resets, but weekend time limited

**Result: 5 issues resolved with AI help, 15 manual**

---

### With Claude-Frugal

**Monday**
```
[For each issue]
User: /slim-read src/parser.js parseAST
Claude: [analyzes specific function - 200 tokens]
User: [identifies issue, creates fix]
User: /distill
User: /compact
```
**8 issues triaged - 12K tokens used**

**Tuesday**
```
[Continue efficient workflow]
```
**7 more issues - 11K tokens used**

**Wednesday-Friday**
```
[Still under limit]
```
**5 more issues - 8K tokens used**

**Total: 20 issues resolved, 31K tokens used (out of ~50K effective limit)**

**Weekend**: Quota still available for emergency patches

**Result: 100% issue resolution with AI help vs 25% before**

---

## Example 5: Refactoring Legacy Code

### Traditional Approach

```
User: Refactor this monolithic controller into services
Claude: [reads entire controller.js - 3K tokens]
Claude: [creates user-service.js]

User: Now the payment logic
Claude: [re-reads controller.js - 3K tokens, forgot to reference previous read]
Claude: [creates payment-service.js]

User: Now the notification logic  
Claude: [re-reads controller.js again - 3K tokens]
Claude: [creates notification-service.js]

Token count: 45K (mostly redundant reads)
```

---

### Claude-Frugal Approach

```
User: /slim-read controller.js
Claude: 📄 controller.js contains:

Classes:
- MonolithicController (line 1)

Functions:
- handleUserRegistration (line 45)
- processPayment (line 120)
- sendNotification (line 200)
- generateReport (line 280)

User: /slim-read controller.js handleUserRegistration
[180 tokens - extracts just that function]

User: Extract this to user-service.js
Claude: [creates user-service.js]

User: /slim-read controller.js processPayment
[200 tokens]

User: Extract to payment-service.js
Claude: [creates payment-service.js]

[continues pattern]

Token count: 8K total
Savings: 37K tokens (82% reduction)
```

---

## Key Patterns Across Examples

### Pattern 1: Targeted Reading
- Use `/slim-read` when you know what you need
- Read full files only for initial architecture understanding
- **Savings: 80-95% per file operation**

### Pattern 2: Proactive Distillation
- Don't wait for red zone
- Distill at natural breakpoints (feature complete, bug fixed, module done)
- **Savings: 40-60K tokens per cycle**

### Pattern 3: Monitoring as Habit
- Start every session with `/limit-watch`
- Check status after major tasks
- **Prevents**: Context bloat, unexpected rate limits

### Pattern 4: Memory as Long-Term Intelligence
- Distilled memories persist across sessions
- Day 1 decisions inform Day 30 work
- **Value: Coherent multi-week projects on Pro tier**

---

## Anti-Patterns to Avoid

### ❌ Don't: Wait until red zone
```
Token count: 68K
Claude: [slow responses]
User: /distill
[Too late - already hit efficiency cliff]
```

### ✅ Do: Distill in yellow zone
```
Token count: 35K
Claude: 🟡 Yellow Zone
User: /distill
[Plenty of margin, smooth experience]
```

---

### ❌ Don't: Full reads for targeted tasks
```
User: Check if the API has rate limiting
Claude: [reads entire 500-line api.js]
```

### ✅ Do: Slim read for targeted info
```
User: /slim-read api.js rateLimitMiddleware
[Finds answer in 150 tokens]
```

---

### ❌ Don't: Distill every 5 messages
```
[Message 1-5]
User: /distill
[Nothing substantial to compress yet]
```

### ✅ Do: Distill after substantial work
```
[Complete feature implementation - 30 messages]
User: /distill
[Captures architecture decisions, bug fixes, new patterns]
```

---

## Your Turn

Try these workflows in your next session. Share your efficiency metrics in Discussions!

**Template for sharing:**
```
## My Claude-Frugal Results

**Project**: [Brief description]
**Before**: [Token usage, messages completed]
**After**: [Token usage with skills, messages completed]
**Savings**: [Percentage or absolute numbers]
**Key skills used**: [Which skills helped most]
```
