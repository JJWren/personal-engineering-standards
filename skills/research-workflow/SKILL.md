---
name: research-workflow
description: >-
  Run a formal three-phase research process using the LlmWiki. Use when
  asked to research a topic, compare options, analyze a body of notes,
  gather evidence, synthesize findings, and provide a final determination.
tags:
  - workflow
  - research
  - wiki
portable-tier: 3
ai-inclusion: manual
---

# Research Workflow

Use a formal three-phase process. All output goes into the LlmWiki.

## Prerequisites

- This skill requires `LLMWIKI_ROOT` — the absolute path to the wiki root directory.
- If `LLMWIKI_ROOT` is missing, stop and report that the personal environment is not configured for wiki work.

## LlmWiki Location

- Root: `$env:LLMWIKI_ROOT`
- Concepts: `wiki/concepts/`
- Decisions: `wiki/decisions/`
- Overview: `wiki/overview/`

## Phase 1: Raw Data Collection

- Gather raw findings, excerpts, observations, and source metadata.
- Always record enough source detail to revisit the material.
- Keep this phase focused on collection, not conclusions.
- When multiple independent sources need investigation, collect from each source separately before synthesizing.

## Phase 2: Research Review

- Review the collected data as a research assistant.
- Separate gathered facts, open questions, and inferred conclusions.
- For comparisons, focus more on differences, tradeoffs, and points of divergence than on similarities.

## Phase 3: Determination

- Create the final deliverable as a LlmWiki page:
  - Use `wiki/decisions/` for decisions and recommendations (type: `decision`)
  - Use `wiki/concepts/` for technical concept analysis (type: `concept`)
  - Use `wiki/overview/` for broad comparisons (type: `comparison`)
- Follow LlmWiki `CLAUDE.md` conventions for frontmatter (`title`, `type`, `sources`, `created`, `updated`, `tags`).
- State the conclusion, recommendation, or judgment.
- Make clear which evidence most strongly supports the determination.
- Call out uncertainty, missing information, and assumptions.
- Update `index.md` with the new page.
- Append an entry to `log.md`.

## General Rules

- Keep raw collection separate from synthesis.
- Ensure every research deliverable includes source traceability.
- When the user asks for a normalization or execution plan, treat the plan as the final Phase 3 output.
