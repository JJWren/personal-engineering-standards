---
name: book-metadata-curator
description: >-
  Evaluates and curates metadata for EPUB and CBZ files. Extracts embedded metadata,
  auto-detects fields from filenames, queries online book databases (Google Books &
  Open Library), embeds tags, genres, authors, and years into files, and copy-relocates
  them into an organized library structure. Wraps the book-tools project via AI_TOOLING_ROOT.
tags:
  - books
  - metadata
  - media-library
---

# Book Metadata Curator

## Overview

Connector skill for the metadata curator in the standalone **book-tools** project
(`https://github.com/JJWren/book-tools`). It analyzes EPUB/CBZ metadata completeness,
queries Google Books and Open Library to fill gaps, writes curated metadata back inside
the files, and copy-relocates them into organized category folders (`Tech`, `Fiction`,
`Warhammer`, `Art`, `History`, `Business`, `Uncategorized`) for structured Kavita libraries.

## Prerequisites

- `AI_TOOLING_ROOT` — absolute path to the ai-tooling projects root (contains `book-tools\`).
- `BOOKS_CURATED_ROOT` — root of the curated library (used as the default for `--output-dir` and to derive the `epub\`/`cbz\` watch directories).
- If `$env:AI_TOOLING_ROOT` is blank, stop and report that the machine is not configured for this skill (see the personal-environment skill).
- Standard Python 3 (stdlib only). Optional: `GOOGLE_BOOKS_API_KEY` for higher rate limits.

## Usage

Tools live at `$env:AI_TOOLING_ROOT\book-tools\src\`.

### 1. Analyze metadata (dry run, no modifications)
```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\book_curator.py" analyze --path "M:\media\books\epub" --output "analysis_report.json"
```

### 2. Curate and relocate (batch)
```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\book_curator.py" curate --path "M:\media\books\epub"
```

### 3. Curate and relocate (interactive)
```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\book_curator.py" curate --path "M:\media\books\epub" --interactive
```

### Subcommands (`book_curator.py`)

- `analyze` — reports completeness and proposed category classification.
  - `--path <path>` (required), `--output <path>` (JSON report).
- `curate` — embeds resolved metadata (EPUB `.opf` / CBZ `ComicInfo.xml`) and copies files into the curated library.
  - `--path <path>` (required), `--output-dir <path>` (default: `$env:BOOKS_CURATED_ROOT`), `--interactive`, `--output <path>`.

### Enrichment queue (`curate_workflow.py`) — human-in-the-loop

```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\curate_workflow.py" propose
python "$env:AI_TOOLING_ROOT\book-tools\src\curate_workflow.py" apply
python "$env:AI_TOOLING_ROOT\book-tools\src\curate_workflow.py" apply --approve-all
```

- `propose` — scans the watch directories under `$env:BOOKS_CURATED_ROOT` for missing/generic metadata, queries Google Books/ComicVine, and writes a reviewable Markdown queue at `book-tools\output\proposed_metadata_updates.md`.
- `apply` — applies rows marked `Y` back into the files and clears them from the queue; `--approve-all` skips the Y/N check.

## Behavior & Safety

- **Completeness**: a book is Complete with a valid Title, Author, Year, and ≥1 Genre/Tag.
- **Sorting**: `epub/[Category]/` and `cbz/[Category]/`; unidentifiable files go to `[format]/Unidentified/` and are logged in `unidentified_books.json`.
- **Naming**: curated files are renamed `[Author] - [Title].[ext]`.
- **Originals untouched**: curation strictly copies; source libraries are never modified.
- **Rate limiting**: 1.0s sleep between online database calls.
