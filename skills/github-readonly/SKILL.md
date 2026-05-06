---
name: github-readonly
description: >-
  Read-only GitHub integration. Use when the user asks about repositories,
  issues, pull requests, branches, tags, releases, workflow runs, or code
  review context from GitHub. Only query GitHub when the user asks or when an
  established workflow explicitly requires it. Never create, update, merge,
  approve, close, label, assign, or modify anything.
---

# GitHub Read-Only

Use GitHub CLI (`gh`) where possible. Fall back to direct REST or GraphQL calls only when needed.

## Prerequisites

- `$env:GITHUB_TOKEN` for authenticated lookups.
- `$env:GITHUB_OWNER` for default owner or organization context.
- GitHub CLI installed and authenticated when script-based access is used.

## Hard Rules

- Read-only by default.
- Never mutate issues, pull requests, labels, projects, workflows, releases, branches, or repository settings.
- Do not echo tokens.
- If a requested operation would write to GitHub, stop and ask for explicit approval or switch to a gated write skill.

## Common Queries

- Repository lookup.
- Issue details.
- Pull request details and checks.
- Branch and tag existence.
- Release notes.
- Workflow run status.

## Suggested Scripts

- `scripts/list_repos.ps1`
- `scripts/list_branches.ps1`
- `scripts/get_issue.ps1`
- `scripts/get_pr.ps1`
- `scripts/list_workflow_runs.ps1`
