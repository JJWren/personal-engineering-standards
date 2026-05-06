# Infrastructure Design - Detailed Steps

**Purpose**: Design the infrastructure and deployment architecture for a unit of work

**Execute when**: Workflow Plan includes Infrastructure Design for this unit

## PART 1: PLANNING

### Step 1: Create Infrastructure Design Plan
- Generate comprehensive plan for infrastructure design for this unit
- Include checklist with [] checkboxes
- Focus on cloud resources, networking, and deployment
- Embed questions using [Answer]: tag format

### Step 2: Store Infrastructure Design Plan
- Save in `aidlc-docs/construction/plans/{unit-name}-infrastructure-design-plan.md`

### Step 3: Wait for User Answers/Approval
- **MANDATORY**: Wait for user answers and explicit plan approval

---

## PART 2: GENERATION

### Step 4: Execute Design
- Perform each step in the approved infrastructure design plan
- Map components to infrastructure services

### Step 5: Design Deployment Architecture
Create `aidlc-docs/construction/{unit-name}/infrastructure-design/deployment-architecture.md`:
- Detail the deployment model (Lambda, ECS, S3)
- Include [Mermaid] deployment diagram

### Step 6: Detail Infrastructure Resources
Create `aidlc-docs/construction/{unit-name}/infrastructure-design/infrastructure-design.md`:
- List all required AWS/cloud resources with configurations
- Define networking (VPC, subnets, SG) and IAM requirements

### Step 7: Update Progress
- Mark steps as [x] in the plan
- Update `aidlc-docs/aidlc-state.md`

### Step 8: Present Completion Message
- **MANDATORY**: Present the standardized 2-option completion message:

```markdown
# ☁️ Infrastructure Design Complete: {unit-name}

[AI-generated summary of key infrastructure decisions in bullet points]

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the infrastructure design artifacts for **{unit-name}** at: `aidlc-docs/construction/{unit-name}/infrastructure-design/`

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the infrastructure design
> ✅ **Continue to Next Stage** - Approve and proceed to **Code Generation**
```

### Step 9: Wait for User Approval
- **MANDATORY**: Wait for user to choose "Continue to Next Stage"
- Update Infrastructure Design stage complete for this unit in aidlc-state.md
