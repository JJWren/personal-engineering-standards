---
name: audit-trail
description: >-
  Record meaningful decisions, changes, findings, and follow-up items in
  the LlmWiki. Use when work produces a durable outcome that should be
  traceable across sessions, especially during debugging, AWS and Azure
  DevOps investigations, code changes, deployment work, or process decisions.
tags:
  - wiki
  - logging
  - workflow
---

# Audit Trail

Use this skill when the work should leave behind a resumable trail, not just a chat transcript.

## Prerequisites

- This skill requires `LLMWIKI_ROOT` — the absolute path to the wiki root directory.
- If `LLMWIKI_ROOT` is missing, stop and report that the personal environment is not configured for wiki work.
- All wiki paths below (`log.md`, `wiki/decisions/`, `wiki/processes/`) are relative to `$env:LLMWIKI_ROOT`.

## Core Workflow

1. Identify whether the latest step was meaningful.
2. If yes, append a short factual entry to `log.md` in the LlmWiki.
3. If the outcome warrants a durable wiki page (architecture decision, process change, significant finding), create or update the appropriate page under `wiki/decisions/` or `wiki/processes/`.
4. Link deeper wiki pages when they already exist instead of duplicating long detail.
5. Follow the LlmWiki conventions for frontmatter, naming, and cross-references.

## What Counts As Meaningful

Log these by default:
- confirmed findings, root causes, and disproven theories
- code or config changes that affect behavior
- AWS, Terraform, GitHub, deployment, networking, or security changes
- manual fixes made outside source control
- decisions about architecture, process, ownership, or next steps
- commands or procedures that should be rerun later

Do not log trivial reads, repeated checks with no new outcome, or filler progress.

## Log Entry Format

Append to `log.md` using this shape:

```
## YYYY-MM-DD HH:mm - Area

Type: Decision | Change | Finding | Risk | Follow-up
Summary: one sentence.
Details:
- concrete facts only
- include environment names, file paths, repo branches, IDs, or commands when they matter
- link to wiki pages with [[wikilinks]] when useful
Next:
- next action, if any
```

## Wiki Page Creation

When the outcome is significant enough for a standalone page:
- Follow LlmWiki conventions for frontmatter (`title`, `type`, `sources`, `created`, `updated`, `tags`).
- Use `type: decision` for architecture or process decisions.
- Update `index.md` with the new page.
- Append a log entry referencing the new page.

## Writing Rules

- Write concise, factual entries.
- Prefer traceability over narrative.
- Capture enough detail that a later session can resume without rereading the whole chat.
- If a dedicated wiki page exists, add the short trace entry to `log.md` and link the deeper page.
- Append entries in chronological order, newest at the bottom.

## Standing Behavior

Treat audit logging as part of the normal completion workflow after meaningful work when this skill is available.
