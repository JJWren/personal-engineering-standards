---
name: llm-wiki
description: >-
  Query, ingest, lint, and maintain the LlmWiki knowledge base (Professional and Personal).
  Use when the user asks about work projects, personal finances, architecture,
  legal matters, processes, or decisions. Trigger on mentions of wiki,
  ingest, lint, or knowledge base queries about life or work topics.
tags:
  - wiki
  - knowledge-base
  - workflow
---

# LlmWiki — Integrated Knowledge Base Skill

This skill provides access to a unified knowledge base split into **Professional** and **Personal** domains.

## Prerequisites

- This skill requires `LLMWIKI_ROOT` — the absolute path to the wiki root directory.
- All wiki paths below are relative to `$env:LLMWIKI_ROOT`.
- Read `references/wiki-schema.md` for full conventions and subfolder mappings.

## Wiki Structure

```
wiki/
├── professional/    — Work projects, systems, people, and orgs
├── personal/        — Finances, legal, military, home-lab, and family
├── log.md           — Unified activity log
├── quick-captures.md — Unified scratchpad
└── index.md         — Unified content index
```

## Operations

### Query

When the user asks a question about work or life:

1. Read `index.md` to find relevant wiki pages.
2. Read the relevant pages (usually 2-5 pages).
3. Synthesize an answer with references using `[[Wiki-Link]]` notation.

### Ingest

When the user wants to add new knowledge (e.g., a court summons or a project requirement):

1. Determine if the source belongs in `professional/` or `personal/`.
2. Update/create pages following conventions in `references/wiki-schema.md`.
3. Update the unified `index.md`.
4. Append an entry to the unified `log.md`.

### Lint

When the user asks for a health check:

1. **Cross-reference audit**: Check every `[[link]]` resolves across both domains.
2. **Category audit**: Ensure files are in the correct top-level category (Professional vs Personal).
3. Report findings in a structured table.

## Page Conventions (Summary)

- **Frontmatter**: title, type, sources, created, updated, tags (kebab-case).
- **Links**: `[[Wiki-Links]]` between any pages in the wiki.
- **Style**: concise, bullet points, tables, Mermaid diagrams.
- **Naming**: `Kebab-Case-Title.md`.

## Hard Constraints

- Never modify raw source notes.
- Always update the unified `index.md` when creating new pages.
- Always append to the unified `log.md` after meaningful updates.
- Bump `updated` date in frontmatter when editing a page.
