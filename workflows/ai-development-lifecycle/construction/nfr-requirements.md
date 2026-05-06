# NFR Requirements - Detailed Steps

**Purpose**: Assess and define Non-Functional Requirements (Performance, Security, Tech Stack) for a unit of work

**Execute when**: Workflow Plan includes NFR Requirements for this unit

## PART 1: PLANNING

### Step 1: Create NFR Requirements Plan
- Generate a comprehensive plan for NFR assessment for this unit
- Include checklist with [] checkboxes
- Focus on tech stack, performance, security, and scalability
- Embed questions using [Answer]: tag format

### Step 2: Store NFR Requirements Plan
- Save in `aidlc-docs/construction/plans/{unit-name}-nfr-requirements-plan.md`

### Step 3: Wait for User Answers/Approval
- **MANDATORY**: Wait for user answers and explicit plan approval

---

## PART 2: GENERATION

### Step 4: Execute Assessment
- Perform each step in the approved NFR plan
- Analyze requirements and constraints

### Step 5: Define NFR Requirements
Create `aidlc-docs/construction/{unit-name}/nfr-requirements/nfr-requirements.md`:
- Document specific NFRs (latency, throughput, availability)
- Define security requirements (authn/authz, encryption)
- Specify scalability and reliability goals

### Step 6: Tech Stack Decisions
Create `aidlc-docs/construction/{unit-name}/nfr-requirements/tech-stack-decisions.md`:
- Document languages, frameworks, and libraries selected
- Justify choices based on requirements

### Step 7: Update Progress
- Mark steps as [x] in the plan
- Update `aidlc-docs/aidlc-state.md`

### Step 8: Present Completion Message
- **MANDATORY**: Present the standardized 2-option completion message:

```markdown
# ⚙️ NFR Requirements Complete: {unit-name}

[AI-generated summary of key NFR decisions in bullet points]

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the NFR artifacts for **{unit-name}** at: `aidlc-docs/construction/{unit-name}/nfr-requirements/`

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the NFR requirements
> ✅ **Continue to Next Stage** - Approve and proceed to **NFR Design** (or Code Generation)
```

### Step 9: Wait for User Approval
- **MANDATORY**: Wait for user to choose "Continue to Next Stage"
- Update NFR Requirements stage complete for this unit in aidlc-state.md
