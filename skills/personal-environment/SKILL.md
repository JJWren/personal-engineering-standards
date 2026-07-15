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
| `AI_TOOLING_ROOT` | Absolute path to the ai-tooling projects root (book-tools, gmail-cli). |
| `KAVITA_DB_PATH` | Absolute path to the Kavita server's `kavita.db` SQLite file. |
| `CALIBRE_LIBRARY_PATH` | Absolute path to the Calibre library root (contains `metadata.db`). |
| `BOOKS_CURATED_ROOT` | Absolute path to the curated books library root. |

## Verification

Use simple checks such as:

```powershell
$env:PERSONAL_OBSIDIAN_VAULT
$env:PERSONAL_REPO_CACHE
$env:GitHub_PAT
$env:GitHub_Issues_TOKEN
$env:AI_TOOLING_ROOT
$env:KAVITA_DB_PATH
$env:CALIBRE_LIBRARY_PATH
$env:BOOKS_CURATED_ROOT
```

If a value that should exist is blank, the machine is not configured for the dependent skill yet.
