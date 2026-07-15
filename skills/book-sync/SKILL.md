---
name: book-sync
description: >-
  Synchronizes metadata (titles, authors, summaries, tags, series) and high-resolution
  cover art from Calibre library folders to curated EPUB files in-place. Wraps the
  book-tools project via AI_TOOLING_ROOT.
tags:
  - books
  - calibre
  - media-library
---

# Book Sync

## Overview

Connector skill for the Calibre sync tool in the standalone **book-tools** project
(`https://github.com/JJWren/book-tools`). It maps curated EPUBs to Calibre records,
extracts values from Calibre's `metadata.opf` descriptors, copies `cover.jpg`, and
writes all fields directly into the curated files.

## Prerequisites

- `AI_TOOLING_ROOT` — absolute path to the ai-tooling projects root (contains `book-tools\`).
- `CALIBRE_LIBRARY_PATH` — root of the Calibre library (contains `metadata.db`; used as the default for `--calibre-lib`).
- If `$env:AI_TOOLING_ROOT` is blank, stop and report that the machine is not configured for this skill (see the personal-environment skill).
- Standard Python 3 (stdlib only).

## How it works

1. **DB lookup**: loads metadata mappings from Calibre's `metadata.db`.
2. **Book matching**: matches curated EPUBs to Calibre records via exact then fuzzy title/author matching.
3. **OPF parsing**: parses the matched book's folder-level `metadata.opf`.
4. **Metadata updates**: injects Publisher, Description, Date, Genres, Series, and Series Index into the curated file (via `book_curator.update_epub_metadata`).
5. **Cover embedding**: overwrites the curated EPUB's internal cover with Calibre's `cover.jpg`.

## Usage

```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\book_sync.py" --curated-path "M:\media\books_curated\epub\Tech"
```

### Options

- `--curated-path` (Required): a single curated `.epub` file or a directory of EPUBs.
- `--calibre-lib` (Optional): Calibre library path. Default: `$env:CALIBRE_LIBRARY_PATH`.

## Examples

Synchronize a single curated EPUB:
```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\book_sync.py" --curated-path "M:\media\books_curated\epub\Tech\Author - Title\Author - Title.epub"
```

Synchronize an entire category directory:
```powershell
python "$env:AI_TOOLING_ROOT\book-tools\src\book_sync.py" --curated-path "M:\media\books_curated\epub\Tech"
```
