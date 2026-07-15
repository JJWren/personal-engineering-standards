---
name: create-pull-request
description: >-
  Create a feature branch, commit requested changes, push the branch, and
  open an GitHub pull request. Use when the user asks to create or
  open a PR, make a branch and PR, commit and push work, or submit code
  changes into a target branch such as main.
tags:
  - git
  - github
  - workflow
---

# Create Pull Request

Use this skill when the user wants end-to-end PR creation in an GitHub repo.

Default scope:

- inspect the repo state
- pull the latest target branch state
- rebase the working branch onto the target branch when creating or updating the PR branch
- create or reuse an appropriate feature branch
- stage only the intended files
- create a non-interactive commit
- push the branch
- open the PR through the GitHub REST API

## Workflow

1. Inspect the repo before changing git state.

- Run `git status --short --branch` and `git remote -v`.
- Confirm the repo root, current branch, and repository remote.
- Read the diff for intended files before staging.
- Do not revert unrelated user changes.

2. Refresh from the target branch before branching, pushing, or creating the PR.

- Determine the target branch the PR will use, commonly `main`.
- Always fetch the latest remote state for the target branch before proceeding.
- Prefer rebasing the working branch onto `origin/<target-branch>` instead of merging from it.
- If rebasing reveals conflicts, resolve them before pushing or opening the PR.
- If the branch has already been pushed, prefer a safe force-push pattern after a successful rebase when needed.

3. Determine GitHub Issues context before creating the PR.

- Try to infer a GitHub Issues key from the current branch name, commit messages, or user request text.
- If no GitHub Issues key can be determined confidently, the agent may make up a descriptive branch name and proceed with the branch, commit, and push steps.
- If no GitHub Issues key can be determined confidently and the repo or user convention appears to require GitHub Issues in the PR title or metadata, ask the user for the GitHub Issues number before creating the PR.
- When a GitHub Issues key is available, include it in the branch name, commit message, and PR title where that matches repo conventions.

4. Choose the smallest safe branch strategy.

- If the user explicitly asked for a new branch, create one from the current checked-out branch unless they named a different base.
- If the current branch already contains the intended changes and is suitable for a PR, reuse it.
- When creating a new branch, always use a feature branch name.
- Use short hyphenated branch names that reflect the change. Prefix with the GitHub Issues key when available, but do not block branch creation when GitHub Issues is unknown.
- Preferred pattern: `features/<issue-or-description>`.

5. Commit only the intended work.

- Stage explicit file paths instead of `git add .` when possible.
- Use a concise commit message that describes the actual change.
- Prefer non-interactive git commands only.

6. Push the branch.

- Use `git push -u origin <branch>` for a new branch.
- After rebasing, update the remote branch with `git push --force-with-lease origin <branch>` before creating the PR.
- If push requires escalation, request it instead of stopping.

7. Create the PR with the bundled script.

- Do not use Azure CLI for PR creation in this skill.
- Always use `scripts/create_github_pr.ps1`.
- Derive the GitHub organization, project, and repository from the repo remote when practical.
- Use full ref names in the request payload, such as `refs/heads/<branch>`.

8. Report the result.

- Return the branch name, commit SHA, PR number, and PR URL.
- If PR creation is blocked, say exactly what succeeded and what remains undone.

## Script

Use the bundled PowerShell script for PR creation:

```powershell
.\scripts\create_github_pr.ps1 `
  -RepositoryUrl "<origin-url>" `
  -SourceBranch "<feature-branch>" `
  -TargetBranch "main" `
  -Title "<pr-title>" `
  -Description "<pr-description>"
```

The script:

- uses `git credential fill` to retrieve stored credentials
- creates Basic auth for GitHub REST
- posts to `_apis/git/repositories/{repo}/pullrequests?api-version=7.0`
- returns normalized PR metadata

## Guardrails

- Never use destructive git commands such as `reset --hard` or `checkout --` unless the user explicitly asked for them.
- Do not include unrelated modified files in the commit.
- If the worktree contains ambiguous or conflicting user changes in the same files, stop and ask before committing.
- Prefer consumer-local fixes over shared-template changes unless the user asked for a shared rollout.
- Keep the PR description short and concrete: summary bullets only.
