# NFR Design - Detailed Steps

**Purpose**: Design the technical patterns to meet NFR requirements for a unit of work

**Execute when**: Workflow Plan includes NFR Design for this unit

## PART 1: PLANNING

### Step 1: Create NFR Design Plan
- Generate comprehensive plan for NFR design for this unit
- Include checklist with [] checkboxes
- Focus on applying patterns for performance, security, and scalability
- Embed questions using [Answer]: tag format

### Step 2: Store NFR Design Plan
- Save in `aidlc-docs/construction/plans/{unit-name}-nfr-design-plan.md`

### Step 3: Wait for User Answers/Approval
- **MANDATORY**: Wait for user answers and explicit plan approval

---

## PART 2: GENERATION

### Step 4: Execute Design
- Perform each step in the approved NFR design plan
- Apply technical patterns to address requirements

### Step 5: Define Logical Components
Create `aidlc-docs/construction/{unit-name}/nfr-design/logical-components.md`:
- Detail internal logical components (caches, queues, connection pools)
- Describe their configuration and usage

### Step 6: Design NFR Patterns
Create `aidlc-docs/construction/{unit-name}/nfr-design/nfr-design-patterns.md`:
- Document specific patterns used (Circuit Breaker, Retry, bulkhead)
- Detail security implementations (JWT validation, encryption layers)

### Step 7: Update Progress
- Mark steps as [x] in the plan
- Update `aidlc-docs/aidlc-state.md`

### Step 8: Present Completion Message
- **MANDATORY**: Present the standardized 2-option completion message:

```markdown
# 🛡️ NFR Design Complete: {unit-name}

[AI-generated summary of key NFR design patterns in bullet points]

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the NFR design artifacts for **{unit-name}** at: `aidlc-docs/construction/{unit-name}/nfr-design/`

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the NFR design
> ✅ **Continue to Next Stage** - Approve and proceed to **Infrastructure Design** (or Code Generation)
```

### Step 9: Wait for User Approval
- **MANDATORY**: Wait for user to choose "Continue to Next Stage"
- Update NFR Design stage complete for this unit in aidlc-state.md
