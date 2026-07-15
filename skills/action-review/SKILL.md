---
name: action-review
description: >-
  Review outstanding ACTION items from the LlmWiki and raw notes. Use when
  the user asks for an action review, morning review, says good morning,
  asks for daily planning, asks for an end-of-day review, or wants help
  finding pressing follow-ups across notes. Also use when the user wants
  a prompt to capture anything to remember or continue tomorrow.
tags:
  - workflow
  - daily
  - planning
---

# Action Review

Prerequisites:

- This skill requires `LLMWIKI_ROOT` for wiki log access and summary writing.
- This skill requires `PERSONAL_OBSIDIAN_VAULT` for raw note scanning.
- If `LLMWIKI_ROOT` is missing, stop and report that the personal environment is not configured for wiki work.
- If `PERSONAL_OBSIDIAN_VAULT` is missing, fall back to scanning the LlmWiki log and wiki pages directly.
- All `log.md` references below are at `$env:LLMWIKI_ROOT\log.md`.

## Preferred Local Script

Use `scripts/collect_actions.ps1` as the preferred workflow for local note scanning.

```powershell
./scripts/collect_actions.ps1
```

The script:

- requires `PERSONAL_OBSIDIAN_VAULT`
- scans the last 14 days by default
- collects only lines beginning with `ACTION:`
- returns JSON with source file, note type, line number, action text, and file modified time
- is the preferred local input for morning and end-of-day action review summaries

If the script is unavailable, scan the LlmWiki log (`log.md`) for recent Follow-up entries and open Next items.

## Morning Review

Use this when the user is starting the workday.

### Step 1 — Collect Data

Gather information from three independent sources:

**Source A — Local Actions:**
- Run `scripts/collect_actions.ps1` for local action extraction (or scan LlmWiki log as fallback).

**Source B — GitHub PRs:**
- Scan GitHub for active PRs in the default repo set:
  - `Letter Generator`
  - `ExampleApp.Integrations.Internal.Letters`
  - `Turn Around Time`
  - `ExampleApp Suite`
  - `Pipelines`
  - `Member Portal Service`
  - `DevOps.Core`
  - `Enterprise Core`

**Source C — GitHub Issues Issues:**
- Scan GitHub Issues for issues assigned to the user.

### Step 2 — Synthesize

- Prioritize:
  - items likely due today
  - items tied to active meetings, deployments, reviews, or blockers
  - items that appear stale but still open
- Present the results as:
  - `Pressing today`
  - `Follow up soon`
  - `Needs clarification`
- Highlight PRs that are new, newly active, waiting on the user, or likely important for today's work.
- Call out GitHub Issues items that are newly assigned, recently updated, or likely pressing.
- Append a summary to the LlmWiki `log.md` capturing the morning plan.

## End-of-Day Review

Use this when the user is wrapping up work.

### Step 1 — Collect Data

Same three sources as Morning Review (Source A, B, C).

### Step 2 — Synthesize

- Present the results as:
  - `Still open`
  - `Carry into tomorrow`
  - `Can likely close or defer`
- Identify anything from GitHub that still needs attention before tomorrow.
- Call out GitHub Issues items that are new or newly important for carry-forward.

## End-of-Day Memory Prompt

At the end of day, ask the user this direct question:

`Is there anything you need to remember or continue tomorrow?`

If the user answers with new information:

- append it to the LlmWiki `log.md` with a Follow-up entry
- preserve the user's wording
- use `ACTION:` prefix when it is a real follow-up

## External Check Guidance

- Use the `github-readonly` skill for PR scanning.
- Use the `github-projects-readonly` skill for assigned GitHub Issues scanning.
- Only query GitHub and GitHub Issues as part of this workflow when the user explicitly triggers action review, morning review, end-of-day review, or `good morning`.
- When reporting PRs and GitHub Issues items, keep the summary concise and focus on what is new, pressing, or waiting on the user.

## Trigger Phrases

These should map to this workflow:

- `review my actions`
- `good morning`
- `morning review`
- `start of day review`
- `end of day review`
- `what do I need to remember tomorrow`
- `what is still open`
