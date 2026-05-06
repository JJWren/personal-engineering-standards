---
name: work-a-github-issue
description: >-
  Work an explicit GitHub issue end to end for developers. Use when the user
  wants to read a named GitHub issue, identify the likely repository and base
  branch, prepare a coding plan, pause for approval, then implement the change,
  add tests when applicable, run validation, update documentation, and
  optionally create a GitHub pull request.
---

# Work a GitHub Issue

## Workflow

1. Read the GitHub issue using `github-readonly`.
2. Identify the likely repository and base branch.
3. Inspect the repository before proposing changes.
4. Load relevant standards with `coding-standards` and `code-change-guidance`.
5. Prepare a concise implementation plan.
6. Pause for approval before coding.
7. Implement the approved change.
8. Add or update tests when applicable.
9. Run existing validation.
10. Update relevant documentation.
11. Offer a gated pull request using `create-pull-request` only when requested.

## Hard Rules

- Do not assume the repository or base branch without evidence.
- Do not update GitHub issue fields unless explicitly requested.
- Do not create a branch, commit, push, or pull request without explicit approval.
- Keep implementation changes focused on the issue scope.
