# Workflow Planning

**Purpose**: Create an execution roadmap for the project

## Step 1: Load Prior Context

**Load all available artifacts from previous stages:**
- `aidlc-docs/inception/reverse-engineering/` (if brownfield)
- `aidlc-docs/inception/requirements/requirements.md`
- `aidlc-docs/inception/user-stories/stories.md` (if executed)

## Step 2: Determine Stages to Execute

Based on the intent, complexity, and clarity, determine which future stages are needed:

### CONSTRUCTION PHASE Stages
- **Functional Design**: Needed for new logic/models
- **NFR Requirements**: Needed for performance/security considerations
- **NFR Design**: Needed if NFR Requirements executed
- **Infrastructure Design**: Needed for cloud/infra changes
- **Code Generation**: ALWAYS needed
- **Build and Test**: ALWAYS needed

## Step 3: Determine Phase Depth

For each selected stage, determine the depth level (Minimal, Standard, Comprehensive) based on the project's complexity and requirements.

## Step 4: Multi-Package Change Sequence (Brownfield Only)

If project is brownfield and involves multiple packages:
- Analyze package dependencies (from reverse engineering)
- Determine the correct order for making changes to packages
- Group changes by package

## Step 5: Generate Workflow Planning Document

Create `aidlc-docs/inception/plans/workflow-planning.md`:

```markdown
# Workflow Execution Plan

## Execution Strategy
[Description of the overall execution approach]

## Selected Stages and Depth
| Phase | Stage | Depth | Justification |
|-------|-------|-------|---------------|
| INCEPTION | Application Design | [Depth] | [Reason] |
| INCEPTION | Units Generation | [Depth] | [Reason] |
| CONSTRUCTION | Functional Design | [Depth] | [Reason] |
| CONSTRUCTION | NFR Requirements | [Depth] | [Reason] |
| CONSTRUCTION | NFR Design | [Depth] | [Reason] |
| CONSTRUCTION | Infrastructure Design | [Depth] | [Reason] |
| CONSTRUCTION | Code Generation | [Depth] | [Reason] |
| CONSTRUCTION | Build and Test | [Standard] | Always required |

## Change Sequence (Brownfield only)
1. **[Package A]**: [Summary of changes]
2. **[Package B]**: [Summary of changes]
...

## Workflow Visualization
[Mermaid diagram showing the execution sequence of stages]
```

## Step 6: Create Unit of Work Plan (Placeholders)

If Units Generation is NOT executed, create a single unit placeholder in `aidlc-docs/inception/plans/unit-of-work-plan.md`:

```markdown
# Unit of Work Plan

## Units
1. **Main Implementation**: [Summary of implementation]
```

## Step 7: Update State Tracking

Update `aidlc-docs/aidlc-state.md`:

```markdown
## Stage Progress
### 🔵 INCEPTION PHASE
- [x] Workspace Detection
- [x] Reverse Engineering (if applicable)
- [x] Requirements Analysis
- [x] User Stories (if applicable)
- [x] Workflow Planning
```

## Step 8: Log and Proceed
   - Log approval prompt with timestamp in `aidlc-docs/audit.md`
   - Present completion message in this structure:
     1. **Completion Announcement** (mandatory): Always start with this:

```markdown
# 🔍 Workflow Planning Complete
```

     2. **AI Summary** (optional): Provide structured bullet-point summary of the planned workflow
        - Format: "Workflow planning has determined the following execution roadmap:"
        - List selected Construction stages and their depth (bullet points)
        - Mention any multi-package sequencing or unit of work strategy
        - Summarize the overall implementation approach
        - DO NOT include workflow instructions ("please review", "let me know", "proceed to next phase", "before we proceed")
        - Keep factual and content-focused
     3. **Formatted Workflow Message** (mandatory): Always end with this exact format:

```markdown
> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the workflow plan at: `aidlc-docs/inception/plans/workflow-planning.md`



> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the workflow plan if required 
> ✅ **Approve & Continue** - Approve workflow plan and proceed to **[Application Design/Units Generation/Functional Design]**

---
```

**Note**: Replace [Application Design/Units Generation/Functional Design] with the actual next stage name.

   - Wait for explicit user approval before proceeding
   - Record approval response with timestamp
   - Update Workflow Planning stage complete in aidlc-state.md
