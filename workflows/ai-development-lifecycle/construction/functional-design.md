# Functional Design - Detailed Steps

**Purpose**: Define the data models, business logic, and rules for a specific unit of work

**Execute when**: Workflow Plan includes Functional Design for this unit

**See [depth-levels.md](../../common/depth-levels.md) for adaptive depth explanation**

## Prerequisites
- INCEPTION Phase must be complete
- For brownfield, Reverse Engineering must be complete

## PART 1: PLANNING

### Step 1: Create Functional Design Plan
- Generate a comprehensive plan for functional design of this unit
- Include a step-by-step execution checklist with [] checkboxes
- Focus on how to design data models, business rules, and domain entities
- Embed questions using [Answer]: tag format for any design ambiguities

### Step 2: Store Functional Design Plan
- Save plan in `aidlc-docs/construction/plans/{unit-name}-functional-design-plan.md`

### Step 3: Wait for User Answers/Approval
- **MANDATORY**: Wait for user to answer questions and approve the plan
- Analyze answers for ambiguities and ask follow-up questions if needed

---

## PART 2: GENERATION

### Step 4: Load Design Plan and Context
- Read the approved plan
- Load requirements and application design context relevant to this unit

### Step 5: Execute Design Steps
- Perform each step in the approved design plan
- Generate design artifacts for this unit

### Step 6: Create Domain Model
Create `aidlc-docs/construction/{unit-name}/functional-design/domain-entities.md`:
- Define core entities, their properties, and relationships
- Include [Mermaid] class diagram for domain model

### Step 7: Define Business Rules
Create `aidlc-docs/construction/{unit-name}/functional-design/business-rules.md`:
- Document specific business rules, calculations, and logic
- Include validation rules and error conditions

### Step 8: Create Business Logic Model
Create `aidlc-docs/construction/{unit-name}/functional-design/business-logic-model.md`:
- Detail the logic flow and service interactions
- Include [Mermaid] sequence or activity diagrams

### Step 9: Update Progress
- Mark each completed step as [x] in the functional design plan
- Update `aidlc-docs/aidlc-state.md` current status

### Step 10: Present Completion Message
- **MANDATORY**: Present the standardized 2-option completion message:

```markdown
# 🎨 Functional Design Complete: {unit-name}

[AI-generated summary of key functional design decisions in bullet points]

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the functional design artifacts for **{unit-name}** at: `aidlc-docs/construction/{unit-name}/functional-design/`

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the functional design
> ✅ **Continue to Next Stage** - Approve design and proceed to **[NFR Requirements/Code Generation]**
```

**Note**: Replace [NFR Requirements/Code Generation] with the actual next stage name for this unit.

### Step 11: Wait for User Approval
- **MANDATORY**: Do not proceed until user explicitly chooses "Continue to Next Stage"
- **MANDATORY**: Log user's response in audit.md with complete raw input
- Update Functional Design stage complete for this unit in aidlc-state.md
