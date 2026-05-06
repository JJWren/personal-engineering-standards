# Code Generation - Detailed Steps

**Purpose**: Generate production-ready code, tests, and documentation for a unit of work

**Execute when**: ALWAYS for each unit

## PART 1: PLANNING

### Step 1: Create Code Generation Plan
- Generate a comprehensive, multi-step plan for code generation
- Include a step-by-step execution checklist with [] checkboxes
- **Plan MUST include**:
  - Implementation of data models and schemas
  - Implementation of core business logic and rules
  - Implementation of NFR patterns (security, performance)
  - Implementation of infrastructure (CDK, Terraform)
  - **Comprehensive test generation** (Unit, Integration, etc.)
  - Generation of API documentation and READMEs
- Embed questions using [Answer]: tag format for any implementation ambiguities

### Step 2: Store Code Generation Plan
- Save plan in `aidlc-docs/construction/plans/{unit-name}-code-generation-plan.md`

### Step 3: Wait for User Answers/Approval
- **MANDATORY**: Wait for user answers and explicit plan approval
- Analyze answers for ambiguities and ask follow-up questions if needed

---

## PART 2: GENERATION

### Step 4: Execute Generation Steps
- Perform each step in the approved code generation plan
- **MANDATORY**: For each step:
  1. Identify target file path and purpose
  2. Implement code/test/artifact following all design patterns and standards
  3. Validate generated content for syntax and quality
  4. Write file to workspace
  5. Mark step as [x] in the code generation plan
  6. Update `aidlc-docs/aidlc-state.md` current status

### Step 5: Final Verification
- Ensure all plan steps are complete
- Verify all generated files exist in correct locations
- Check for basic syntax correctness across files

### Step 6: Present Completion Message
- **MANDATORY**: Present the standardized 2-option completion message:

```markdown
# 💻 Code Generation Complete: {unit-name}

[AI-generated summary of generated code, tests, and artifacts in bullet points]

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the generated files for **{unit-name}** in the workspace.

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the generated code
> ✅ **Continue to Next Stage** - Approve code and proceed to **[Next Unit / Build and Test]**
```

**Note**: Replace [Next Unit / Build and Test] with the actual next unit name or "Build and Test" if this is the final unit.

### Step 7: Wait for User Approval
- **MANDATORY**: Wait for user to choose "Continue to Next Stage"
- Update Code Generation stage complete for this unit in aidlc-state.md
