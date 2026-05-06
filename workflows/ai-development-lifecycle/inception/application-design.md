# Application Design

**Purpose**: Define the high-level technical architecture, components, and service layers

**See [depth-levels.md](../common/depth-levels.md) for adaptive depth explanation**

## Prerequisites
- Requirements Analysis must be complete
- Workflow Plan must include Application Design

## Step 1: Component Definition
Define the software components, their responsibilities, and how they interact.

Create `aidlc-docs/inception/application-design/components.md`:
```markdown
# System Components

## Component Overview
[Mermaid component diagram]

## Component Details
### [Component Name]
- **Responsibility**: [What it does]
- **Key Methods**: [Primary functions]
- **Dependencies**: [Other components it uses]
```

## Step 2: Component Methods (MANDATORY)
Define the core methods and business rules for each component.

Create `aidlc-docs/inception/application-design/component-methods.md`:
```markdown
# Component Methods and Business Rules

## [Component Name]
### [Method Name]
- **Purpose**: [Description]
- **Input**: [Parameters]
- **Output**: [Return value]
- **Business Rules**:
  - [Rule 1]
  - [Rule 2]
```

## Step 3: Service Layer Design
Define the service layer architecture and patterns.

Create `aidlc-docs/inception/application-design/services.md`:
```markdown
# Service Layer Design

## Service Patterns
- [Pattern name] - [How it's applied]

## Service Definitions
### [Service Name]
- **Purpose**: [Description]
- **Interfaces**: [Key interfaces]
- **Implementation**: [Key classes]
```

## Step 4: Component Dependency Mapping
Detail the dependencies between components and external systems.

Create `aidlc-docs/inception/application-design/component-dependency.md`:
```markdown
# Component Dependency Map

## Internal Dependencies
[Mermaid diagram]

## External Integration
- **[System Name]**: [Protocol, purpose, data shared]
```

## Step 5: Update State Tracking
Update `aidlc-docs/aidlc-state.md` with Application Design completion status.

## Step 6: Present Completion Message

```markdown
# 🏛️ Application Design Complete

[AI-generated summary of key design decisions in bullet points]

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the design artifacts at: `aidlc-docs/inception/application-design/`

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **You may:**
>
> 🔧 **Request Changes** - Ask for modifications to the application design
> ✅ **Approve & Continue** - Approve design and proceed to **Units Generation** (or Functional Design)
```

## Step 7: Wait for User Approval
- **MANDATORY**: Do not proceed until user explicitly approves
- **MANDATORY**: Log user's response in audit.md with complete raw input
