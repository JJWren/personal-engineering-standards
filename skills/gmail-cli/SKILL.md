---
name: gmail-cli
description: >-
  Interact with the user's Gmail mailbox (list recent emails, search messages, retrieve
  message details, modify labels/archive, scan attachments, and send emails). Supports
  multiple account profiles. Use when the user asks to read, find, send, or organize
  their email. Wraps the gmail-cli project via AI_TOOLING_ROOT.
tags:
  - email
  - gmail
  - communication
---

# Gmail CLI — Mailbox Integration Skill

Connector skill for the standalone **gmail-cli** project
(`https://github.com/JJWren/gmail-cli`), which provides programmatic access to read,
search, organize, and send emails via the Google Gmail API.

## Prerequisites

- `AI_TOOLING_ROOT` — absolute path to the ai-tooling projects root (contains `gmail-cli\`).
  If `$env:AI_TOOLING_ROOT` is blank, stop and report that the machine is not configured
  for this skill (see the personal-environment skill).
- Python 3.x with the dependencies from the project's `requirements.txt` installed.
- OAuth client credentials from Google Cloud Console at `~\.gmail-cli\credentials.json`;
  access tokens are cached per account profile in `~\.gmail-cli\`.

## Operations

The tool is executed as:
`python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" [-a <account>] <command> [options]`

Multiple Google accounts are supported via `-a/--account <profile>` (default profile: `default`).

### 1. Authenticate / check status
Initializes or verifies the connection. If the token is expired or missing, a local
server flow opens a browser window for authorization.
```powershell
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" auth
```

### 2. List recent emails (JSON output)
```powershell
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" list --max-results 10
```

### 3. Search emails (Gmail query syntax)
```powershell
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" search --query "is:unread from:github"
```

### 4. Read a specific email (decoded body)
```powershell
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" get <message_id>
```

### 5. Send an email
```powershell
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" send --to "recipient@example.com" --subject "Hello" --body "Message body."
```

### 6. Modify labels / archive
```powershell
# Archive (remove INBOX)
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" label <message_id> --remove "INBOX"

# Mark as read
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" label <message_id> --remove "UNREAD"

# Star
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" label <message_id> --add "STARRED"
```

### 7. Accounts and attachments
```powershell
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" accounts
python "$env:AI_TOOLING_ROOT\gmail-cli\gmail_tool.py" scan-attachments <message_id>
```

## Constraints & Usage Rules

- **First-time auth**: any command may trigger a browser OAuth prompt and waits for user authorization.
- **Privacy and data minimization**: query headers (`list`/`search`) before fetching a specific email's body. Do not download email contents in bulk.
- **Safety**: no permanent-delete command exists by design. Archive via `label <id> --remove INBOX`.
