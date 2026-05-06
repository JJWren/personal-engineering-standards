---
name: user-story-creator
description: >-
  Draft implementation-ready user stories in the LlmWiki from features,
  requirements, meeting notes, or rough ideas. Use when asked to create,
  split, refine, normalize, or rewrite user stories, acceptance criteria,
  feature slices, or story outlines. Create wiki pages only; never create
  or update GitHub Issues issues directly.
tags:
  - workflow
  - stories
  - wiki
portable-tier: 2
ai-inclusion: manual
---

# User Story Creator

Use this skill when the user wants user stories created or refined.

## Prerequisites

- This skill requires `LLMWIKI_ROOT` — the absolute path to the wiki root directory.
- If `LLMWIKI_ROOT` is missing, stop and report that the personal environment is not configured for wiki work.

## Output Location

Story pages go under `$env:LLMWIKI_ROOT\wiki\projects\` as sub-pages or linked artifacts of the relevant project page. Follow LlmWiki conventions for frontmatter, naming, and cross-references.

Read `references/story-design-standard.md` when deciding how to split or evaluate stories.

## Core Rules

- Create or update pages in the LlmWiki only.
- Never create, update, transition, or comment on GitHub Issues issues.
- Preserve the user's wording where practical, but organize it into a usable story format.
- Keep broad scope in a parent feature or summary page when needed.
- Create sprint-ready stories only when they are small, testable, and near implementation.
- Prefer stories that stay within a single codebase.
- Use tasks or subtasks for technical decomposition, not separate user stories when there is no independent user-visible slice.

## Workflow

### 1. Gather the scope

Capture:
- business goal
- actor or user
- desired outcome
- constraints
- target codebase or system boundary if known
- explicit validation or test expectations

If the user gives broad multi-system scope, treat it as a feature or story set first, not as one implementation-ready story.

### 2. Decide the level

Use these levels:
- Feature or story-set page: for broad approved scope, multi-codebase work, or coordinated changes
- User story page: for implementation-ready, testable slices
- Tasks within the page: for technical breakdown

If the work spans multiple codebases, create a parent page and split child stories by codebase or deployable boundary.

### 3. Shape each story

A good story should usually be:
- small enough to complete in one day to a few days
- testable and verifiable
- independently demonstrable
- owned by one team
- limited to one codebase when practical

Challenge stories that are:
- just a requirement paragraph renamed as a story
- split only by controller/service/database layers
- missing acceptance criteria
- too large to verify clearly

### 4. Write the page

Follow LlmWiki conventions. Preferred story page shape:

```yaml
---
title: "User Story: <Title>"
type: concept
sources:
  - "[[Source-Note-or-Meeting]]"
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - user-story
  - <project-tag>
---
```

```markdown
# User Story: <Title>

## Story
As a <user/actor>
I want <capability/change>
So that <business outcome>

## Acceptance Criteria
- ...

## Verification
- ...

## Technical Context
- Repository / codebase
- Dependencies
- Constraints

## Notes
- ...

## Related
- [[Project-Page]]
```

For a grouped feature page, use:
- feature summary
- scope boundaries
- assumptions
- story list
- open questions

### 5. Definition of Ready check

Before finalizing a story, confirm:
- purpose is clear
- scope is narrow enough
- acceptance criteria are explicit and testable
- verification method is known
- ownership is clear
- dependencies are explicit
- the story usually fits one codebase

If not, split or rewrite before finishing.

### 6. Update wiki index

- Update `index.md` with any new pages.
- Append an entry to `log.md`.

## Writing Guidance

- Make acceptance criteria outcome-focused and verifiable.
- Avoid implementation prescriptions inside acceptance criteria unless technically necessary.
- Prefer vertical slices over layer-by-layer stories.
- Use concise technical context when it helps the next step.
- When converting rough notes into stories, keep the parent context in a separate summary page instead of overloading one story.
