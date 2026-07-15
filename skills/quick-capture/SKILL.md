---
name: quick-capture
description: >-
  Quickly add timestamped notes, links, and ideas to LlmWiki without formal
  ceremony. Use when the user wants to jot down a thought, bookmark a link,
  log an idea, or record a quick observation that can be promoted to a formal
  decision record later.
tags:
  - wiki
  - notes
  - workflow
---

# Quick Capture

Use this skill to add lightweight, timestamped notes to the LlmWiki Quick Captures page.
Invoke with `/quick-capture` or by directly asking to capture a note, idea, or link.

## Prerequisites

- This skill requires `LLMWIKI_ROOT` — the absolute path to the wiki root directory.
- If `LLMWIKI_ROOT` is missing, stop and report that the personal environment is not configured for wiki work.
- The Quick Captures page is located at `wiki/quick-captures.md` relative to `$env:LLMWIKI_ROOT`.

## Core Workflow

1. Read the current Quick Captures page (create it if it does not exist).
2. Determine today's date heading (`## YYYY-MM-DD`). If today's section does not exist, add it below the frontmatter and above older sections.
3. Append the note under today's date heading using the entry format below.
4. If relevant, tag the entry with a project or topic in parentheses.
5. Commit the wiki change for version history.

## Entry Format

Each entry is a single bulleted line under the date heading:

```
- [HH:MM] Note text, link, or idea. (optional-tag)
```

Examples:

```
## 2026-04-20

- [09:15] Noticed ExampleApp health-check endpoint returns 503 during deploy window. (example-app)
- [10:42] https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml — useful YAML pipeline reference.
- [14:03] Idea: add a retry decorator to the GitHub API wrapper. (github-tooling)
```

## Writing Rules

- Keep each note to one or two sentences maximum. Expand later if needed.
- Use the current time for the timestamp, not an approximation.
- Include URLs inline when capturing links.
- Tag with a project or topic keyword in parentheses when the context is clear.
- Do not duplicate notes that already exist under the same date.
- Preserve existing entries; only append.

## Page Creation

If `wiki/quick-captures.md` does not exist, create it with this template:

```markdown
---
title: Quick Captures
type: log
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - captures
  - notes
---

# Quick Captures

Lightweight timestamped notes, links, and ideas. Promote to formal wiki pages or decision records when they mature.
```

## Promoting Notes

When a captured note grows into a decision, finding, or process change:

1. Use the `audit-trail` skill to create a formal log entry or wiki page.
2. Add a `promoted` marker to the original capture: `- [HH:MM] ~~Note text.~~ Promoted to [[page-name]].`
3. This keeps the trail intact without losing the original timestamp.

## Standing Behavior

When the user says "capture", "jot down", "note this", "remember this", "quick note", or uses `/quick-capture`, treat the request as a quick-capture operation and use this skill immediately.
