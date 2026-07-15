---
name: code-change-guidance
description: >-
  Use when making or reviewing implementation, pipeline, or configuration
  changes and you need code-change preferences rather than only code-style
  rules. Apply this skill to maximize reuse of existing templates and
  abstractions, keep entrypoint files thin, verify tags, branches, versions,
  and refs before pinning them, and prefer explicit refs such as
  refs/tags/tag-name when shared dependencies are versioned.
tags:
  - code-quality
  - pipelines
  - review
---

# Code Change Guidance

Use this skill for change strategy. Use `coding-standards` separately for formatting, naming, typing, and touched-block cleanup.

## Core Rules

- Reuse first. Before adding new pipeline jobs, scripts, or config blocks, inspect the repo and shared dependencies for an existing template, abstraction, or pattern to extend.
- Keep entrypoint files thin. Prefer small top-level YAML or config files that delegate to shared templates instead of duplicating job logic inline.
- Match the repo's architecture. If the project already has a local template or shared pattern, extend that pattern instead of creating a parallel one-off path.
- Minimize behavioral duplication. If two pipelines or flows differ only by trigger or environment, push the behavior into a shared template with parameters.

## Verification Rules

- Verify before pinning. Before changing a dependency, template repo ref, package version, branch, or tag, confirm it exists in the correct repo.
- Be explicit when versioning shared resources. If a tag is intended, prefer `refs/tags/tag-name` after confirming it exists.
- Verify syntax as well as existence. Make sure the ref format is valid for the tool or platform being configured.
- If you did not verify something before changing it, state that clearly and verify it before closing the work.
- When shared pipeline templates, release tags, or versioned resource refs change, update the corresponding documentation as part of the change, not as optional follow-up.

## Pipeline Guidance

- Prefer shared pipeline templates from the designated pipelines repo when they fit the need.
- If a new manual pipeline is needed, make it a thin wrapper over shared or existing local templates.
- Avoid hidden duplicate builds. If a project is explicitly built earlier in the pipeline, run tests with `--no-build` unless a rebuild is intentionally required.
- For feature-branch validation flows, ensure the pipeline actually checks out and builds from the queued branch rather than silently using artifacts or refs from another branch.

## Review Checklist

Before finishing a change, check:

- Did I reuse the best existing template or abstraction?
- Did I avoid introducing a one-off inline implementation where a shared template should exist?
- Did I verify every new pinned ref, tag, branch, or version?
- Did I choose the most explicit safe ref syntax when pinning a shared dependency?
- Did I update any nearby docs or PR description when the workflow changed?
- Did I update the documentation when I changed shared pipeline releases, template guidance, or versioned consumption examples?
