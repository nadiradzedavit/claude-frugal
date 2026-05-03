---
skill: slim-read
description: Read only specific functions/classes from files instead of entire contents
args:
  file_path:
    type: string
    description: Path to the file to read
    required: true
  target:
    type: string
    description: Function name, class name, or line range (e.g., "MyClass", "my_function", "50-100")
    required: false
---

# Slim Read Skill

Precision file reading that extracts only what you need, saving thousands of tokens per operation.

## Standard Read vs Slim Read

**Standard Read** (file.py with 500 lines):
- Loads entire file: ~1500-2000 tokens
- Includes irrelevant code, imports, comments
- Multiplied across 10 files = 15K-20K tokens wasted

**Slim Read** (same file):
- Extract single function: ~50-200 tokens
- 90-95% token reduction per read
- Multiplied across 10 files = 500-2K tokens

## Instructions

### When target is specified:

1. **Read the file** using the standard Read tool
2. **Parse and locate** the target:
   - For function: Find `def function_name` or `function function_name` 
   - For class: Find `class ClassName`
   - For range: Extract lines N-M
3. **Extract context**:
   - Include the target's full definition
   - Include docstring if present
   - Include 2-3 lines before/after for context
   - Include type hints and decorators
4. **Output focused result**:
   ```
   📄 {file_path}:{line_start}-{line_end}
   
   [extracted code block]
   
   💾 Saved ~{N} tokens vs full file read
   ```

### When target is NOT specified:

1. **Use grep** to find all definitions:
   ```bash
   grep -n "^def \|^class \|^function \|^export " {file_path}
   ```
2. **Present slim menu**:
   ```
   📄 {file_path} contains:
   
   Classes:
   - UserAuth (line 45)
   - TokenManager (line 120)
   
   Functions:
   - validate_token (line 89)
   - refresh_session (line 156)
   
   💡 Use: /slim-read {file_path} [target_name]
   Or specify line range: /slim-read {file_path} 89-95
   ```

### When to use Slim Read:

✅ **USE** when:
- Inspecting specific function logic
- Reviewing a particular class
- User asks "check the X function"
- You know exactly what you need

❌ **DON'T USE** when:
- First time seeing a file (need full structure)
- Debugging cross-function issues
- File is already small (<100 lines)
- Need to understand overall architecture

## Pro User Workflow

**Scenario**: Debugging auth bug across 5 files

Traditional approach:
1. Read auth.py (2000 tokens)
2. Read middleware.py (1500 tokens)  
3. Read utils.py (1200 tokens)
4. Read config.py (800 tokens)
5. Read models.py (2500 tokens)
**Total**: 8000 tokens, only needed 300 tokens of actual code

Slim Read approach:
1. `/slim-read auth.py validate_user` (150 tokens)
2. `/slim-read middleware.py AuthMiddleware` (200 tokens)
3. `/slim-read utils.py hash_password` (100 tokens)
4. `/slim-read config.py` → select AUTH_CONFIG (80 tokens)
5. `/slim-read models.py User` (250 tokens)
**Total**: 780 tokens - **90% savings**

## Implementation Notes

- Use `grep -A 20` to extract function body after finding definition
- Use `awk` for precise line range extraction  
- Cache the file map (class/function locations) to avoid re-scanning
- For TypeScript/JS, match `export function`, `export class`, `const X =`
- For Python, match `def `, `class `, `async def`
