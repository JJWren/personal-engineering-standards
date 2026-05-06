# Build and Test - Detailed Steps

**Purpose**: Provide instructions for building and testing the entire system

**Execute when**: ALWAYS after all units complete

## Step 1: Generate Build Instructions
Create `aidlc-docs/construction/build-and-test/build-instructions.md`:
- Detail step-by-step build process for all components
- Include environment setup, dependency installation, and build commands

## Step 2: Generate Unit Test Instructions
Create `aidlc-docs/construction/build-and-test/unit-test-instructions.md`:
- Instructions for running unit tests for all components
- Include test report location and interpretation

## Step 3: Generate Integration Test Instructions
Create `aidlc-docs/construction/build-and-test/integration-test-instructions.md`:
- Detailed steps for running integration tests between units and external systems
- Include environment requirements and test data setup

## Step 4: Generate Performance Test Instructions (If applicable)
Create `aidlc-docs/construction/build-and-test/performance-test-instructions.md`:
- Steps for load, stress, or latency testing based on NFRs

## Step 5: Generate Summary Report
Create `aidlc-docs/construction/build-and-test/build-and-test-summary.md`:
- Summarize all test coverage and verification methods

## Step 6: Update State Tracking
Update `aidlc-docs/aidlc-state.md` with Build and Test completion status.

## Step 7: Present Completion Message

```markdown
# 🧪 Build and Test Instructions Complete

Comprehensive build and test documentation has been generated.

> **📋 <u>**REVIEW REQUIRED:**</u>**  
> Please examine the build and test instructions at: `aidlc-docs/construction/build-and-test/`

> **🚀 <u>**WHAT'S NEXT?**</u>**
>
> **Ready to proceed to Operations stage?**
```

## Step 8: Wait for User Approval
- **MANDATORY**: Wait for user explicit approval to move to Operations
- Update CONSTRUCTION Phase complete in aidlc-state.md
