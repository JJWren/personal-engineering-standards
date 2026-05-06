# Units Generation

**Purpose**: Decompose the project into manageable, sequenceable units of work

**See [depth-levels.md](../common/depth-levels.md) for adaptive depth explanation**

## Prerequisites
- Requirements Analysis must be complete
- Application Design recommended (if needed)

## Step 1: Unit Decomposition
Decompose the project into discrete units of work (e.g., specific services, UI modules, database layers).

Create `aidlc-docs/inception/application-design/unit-of-work.md`:
```markdown
# Units of Work

## Unit List
1. **[Unit Name]**: [Description]
2. **[Unit Name]**: [Description]
...
```

## Step 2: Unit Dependency Mapping
Define the execution order and dependencies between units.

Create `aidlc-docs/inception/application-design/unit-of-work-dependency.md`:
```markdown
# Unit Dependency Map

## Execution Order
1. [Unit A]
2. [Unit B] (Depends on A)
...

## Dependency Diagram
[Mermaid diagram]
```

## Step 3: Story Mapping (If User Stories executed)
Map user stories to their corresponding units of work.

Create `aidlc-docs/inception/application-design/unit-of-work-story-map.md`:
```markdown
# Unit-Story Mapping

| Unit | User Stories |
|------|--------------|
| [Unit Name] | [Story IDs] |
```

## Step 4: Generate Execution Plan
Create the sequential plan for executing units through the CONSTRUCTION phase.

Create `aidlc-docs/inception/plans/unit-of-work-plan.md`:
```markdown
# Unit Execution Plan

## Sequence
- [ ] Unit 1: [Name]
- [ ] Unit 2: [Name]
...
```

## Step 5: Update State Tracking
Update `aidlc-docs/aidlc-state.md` with Units Generation completion status.

## Step 6: Present Completion Message

```markdown
# 🧩 Units Generation Complete

[AI-generated summary of work units and their sequence in bullet points]

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the unit definitions at: `aidlc-docs/inception/application-design/unit-of-work.md`

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the unit decomposition
> ✅ **Approve & Continue** - Approve units and proceed to **CONSTRUCTION Phase** (Functional Design)
```

## Step 7: Wait for User Approval
- **MANDATORY**: Do not proceed until user explicitly approves
- **MANDATORY**: Log user's response in audit.md with complete raw input
