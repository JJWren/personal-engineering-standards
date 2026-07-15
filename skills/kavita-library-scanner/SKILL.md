---
name: kavita-library-scanner
description: >-
  Scans a locally hosted Kavita SQLite database (`kavita.db`) to aggregate book, comic,
  and reading material metadata. Generates a structured JSON dataset and an interactive
  self-contained HTML dashboard, or prints terminal summary stats. Wraps the book-tools
  project via AI_TOOLING_ROOT.
tags:
  - books
  - kavita
  - media-library
---

# Kavita Library Scanner

## Overview

Connector skill for the Kavita scanner in the standalone **book-tools** project
(`https://github.com/JJWren/book-tools`). It scans a Kavita server's `kavita.db`,
aggregates libraries, series, volumes, chapters, genres, tags, and creators, and
generates a JSON dataset plus a self-contained interactive HTML dashboard.

## Prerequisites

- `AI_TOOLING_ROOT` — absolute path to the ai-tooling projects root (contains `book-tools\`).
- `KAVITA_DB_PATH` — absolute path to the Kavita `kavita.db` SQLite file (used as the default for `--db-path`).
- If `$env:AI_TOOLING_ROOT` is blank, stop and report that the machine is not configured for this skill (see the personal-environment skill).
- Standard Python 3 (stdlib only).

## Usage

The tool lives at `$env:AI_TOOLING_ROOT\book-tools\src\kavita_scanner.py`.

Quick text summary of library stats:
```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\kavita_scanner.py" stats
```

Scan the library and regenerate the dashboard + JSON dataset:
```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\kavita_scanner.py" scan
```

### Subcommands

- `scan` — extracts all metadata and writes `kavita_books_metadata.json` + `dashboard.html`.
  - `--db-path <path>`: Kavita DB file. Default: `$env:KAVITA_DB_PATH`.
  - `--output-dir <path>`: output folder. Default: `book-tools\output\` (gitignored).
- `stats` — prints a summary table to the console.
  - `--db-path <path>`: Kavita DB file. Default: `$env:KAVITA_DB_PATH`.

View the dashboard by opening `$env:AI_TOOLING_ROOT\book-tools\output\dashboard.html` in a browser.

## Common Mistakes

1. **Drive not mounted**: The Kavita DB typically lives on a network drive (`Z:\`). If disconnected, the script exits with a clear file-not-found error.
2. **Database locked**: If Kavita is actively scanning/writing, SQLite may report a lock. Let Kavita finish and retry.
