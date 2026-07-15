---
name: personal-environment
description: >-
  Check for and manage personal environment configuration, including
  paths to the wiki, Obsidian vault, and repo cache. Use when a skill
  requires these paths but they are missing or when the user wants to
  verify their local setup.
tags:
  - config
  - environment
---

# Personal Environment

Verify these environment variables are set in the user's environment.

## Required Variables

| Variable | Purpose |
|----------|---------|
| `LLMWIKI_ROOT` | Absolute path to the LlmWiki root directory. |
| `PERSONAL_OBSIDIAN_VAULT` | Absolute path to the personal Obsidian vault. |
| `PERSONAL_REPO_CACHE` | Absolute path to where cloned repositories are cached. |
| `GitHub_PAT` | GitHub Personal Access Token for authenticated REST calls. |
| `GitHub Issues_TOKEN` | Token specifically for GitHub Issues access if separate. |

## Verification

Use simple checks such as:

```powershell
$env:PERSONAL_OBSIDIAN_VAULT
$env:PERSONAL_REPO_CACHE
$env:GitHub_PAT
$env:GitHub_Issues_TOKEN
```

If a value that should exist is blank, the machine is not configured for the dependent skill yet.
