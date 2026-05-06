---
name: github-projects-readonly
description: >-
  Read-only GitHub Projects integration. Use when the user asks about project
  items, project fields, status, priority, roadmap views, or issue planning
  context from GitHub Projects. Never create, update, archive, reorder, or
  modify project items.
---

# GitHub Projects Read-Only

Use this skill to inspect GitHub Projects without mutating project data.

## Prerequisites

- `$env:GITHUB_TOKEN` with permission to read the target project.
- `$env:GITHUB_OWNER` for default owner or organization context.
- `$env:GITHUB_PROJECT_NUMBER` when a default project is configured.
- GitHub CLI installed when script-based access is used.

## Rules

- Read-only by default.
- Do not update project fields, status, priority, dates, labels, assignees, or item order.
- Use GraphQL for Project v2 data when `gh project` cannot return the required fields.
- Summarize project status with source URLs or item IDs when possible.

## Suggested Scripts

- `scripts/get_project_items.ps1`
