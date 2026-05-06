# Wiki Schema Reference

This is the full schema governing the LlmWiki. Treat it as the authoritative reference for conventions, page types, and workflows.

## Directory Structure

```
wiki/
├── professional/    — Work-related knowledge
│   ├── overview/    — Org overview, technology landscape, project portfolio
│   ├── projects/    — Project pages
│   ├── systems/     — System and service pages
│   ├── people/      — Team member pages
│   ├── orgs/        — Organization pages
│   ├── processes/   — SOP and workflow pages
│   ├── concepts/    — Pattern and domain concept pages
│   └── decisions/   — Architectural decision records
├── personal/        — Life management knowledge
│   ├── finances/    — Taxes, budgeting, investments
│   ├── legal/       — Court documents, attorney records
│   ├── military/    — Service records, VA documents
│   ├── home-lab/    — Docker, VM, networking docs
│   ├── family-health/ — Medical, family records
│   ├── knowledge/   — Learning, books, second brain
│   ├── hobbies/     — Photography, personal code
│   └── logistics/   — Vehicle, home, travel
├── index.md         — Unified content catalog
├── log.md           — Unified chronological record
└── quick-captures.md — Unified timestamped notes
```

## Page Types

| Type | Directory | Purpose | Key Sections |
|------|-----------|---------|-------------|
| project | professional/projects/ | One per major work project | Team, Repos, Architecture, Status, Decisions, Related |
| system | professional/systems/ | One per system or service | Purpose, Architecture, Tech Stack, APIs, Related |
| person | professional/people/ | One per person | Role, Team, Expertise, Projects, Related |
| org | professional/orgs/ | One per organization | Overview, Relationship, Contacts, Related |
| process | professional/processes/ | One per SOP or workflow | Summary, Steps, Tools, Responsibilities, Related |
| concept | professional/concepts/ | One per pattern/domain concept | Definition, Where Used, Details, Tradeoffs, Related |
| decision | professional/decisions/ | For significant decisions | Context, Options, Decision, Rationale, Who, Related |
| life-doc | personal/{folder}/ | Personal life records | Varies by subfolder |

## Frontmatter Template

```yaml
---
title: Page Title
type: project | system | person | org | process | concept | decision | overview | life-doc
sources:
  - "[[Source-Note-Name]]"
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - kebab-case-tag
---
```

## Content Rules

- Lead with 1-2 sentence summary.
- `##` sections for organization.
- `[[Wiki-Links]]` between wiki pages.
- Tables for structured data.
- Mermaid diagrams for architecture/workflows.
- Bullet points over prose.
- `## Related` section at bottom.

## Cross-Reference Rules

- Wiki pages link to wiki pages only.
- `sources` frontmatter tracks provenance to raw notes.
- People links use `[[Kebab-Case-Name]]` format.

## Naming

- Filenames: `Kebab-Case-Title.md`
- Directories: lowercase
- Descriptive names: `Letter-Generator.md` not `LG.md`

## Index and Log

- **index.md**: Unified catalog for all categories. Update page count in header.
- **log.md**: Unified append-only record for both Professional and Personal operations.
- **quick-captures.md**: Unified scratchpad for all immediate thoughts.
