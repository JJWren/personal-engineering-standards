# Personal Engineering Standards

This repository centralizes my language standards, AI-assisted development workflows, and portable AI skills. It is designed to be a "living" repository that I can clone to any machine and deploy to my AI tools.

## Structure

- `steering/` - High-level AI tool steering documents that override default behaviors.
- `standards/` - Detailed coding and architecture standards for specific languages and frameworks.
- `workflows/ai-development-lifecycle/` - The comprehensive AI-DLC workflow rules and stages.
- `skills/` - Portable AI skills (prompts and instructions) that can be synced to multiple tools.
- `llm-wiki/` - Schema and templates for the LlmWiki work knowledge base.

## Setup

1. Clone this repository to `C:\Users\joshu\source\personal-engineering-standards`.
2. Ensure the following environment variables are set:
   - `LLMWIKI_ROOT`
   - `PERSONAL_OBSIDIAN_VAULT`
   - `PERSONAL_REPO_CACHE`
   - `GitHub_PAT`
   - `GitHub Issues_TOKEN`
3. Run `.\setup.ps1` to deploy steering and skills to your local AI tools.

## Syncing Skills

Run `.\sync-skills.ps1` to sync your portable skills across different AI tools and environments.

## Contribution

Update these standards as your preferences and best practices evolve. This repository is the "source of truth" for how I want to work with AI.
