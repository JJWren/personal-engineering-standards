# Example Organization Engineering Standards Setup

When working with any project (new or existing), follow these steps to ensure compliance with Example Organization engineering standards:

## 1. Clone Engineering Standards Repository

**First, check if the repository is already cloned:**

**Windows PowerShell Commands:**
```powershell
$StdPath = Join-Path $env:USERPROFILE ".engineering-standards"

if (Test-Path (Join-Path $StdPath ".git")) {
    Write-Host "Engineering standards already cloned. Updating..."
    cd $StdPath
    git pull
} else {
    git clone https://github.com/<github-owner>/personal-ai-standards.git $StdPath
}

# Deploy skills and steering to your installed AI tools
cd $StdPath
.\setup.ps1
```

**Linux/macOS Commands:**
```bash
STD_PATH="$HOME/.engineering-standards"

if [ -d "$STD_PATH/.git" ]; then
    echo "Engineering standards already cloned. Updating..."
    cd "$STD_PATH"
    git pull
else
    git clone https://github.com/<github-owner>/personal-ai-standards.git "$STD_PATH"
fi

cd "$STD_PATH"
pwsh -File ./setup.ps1
```

**This is typically a one-time operation per developer workstation.** The `setup.ps1` script detects your installed AI tools (Claude Code, Codex CLI, Copilot CLI, AI tool) and deploys skills and steering documents to each tool's native location. Re-run after `git pull` to pick up updates.

## 2. Read the Standards Repository README

After cloning, read the README file to understand the latest guidelines and any important updates:

**Windows PowerShell Commands:**
```powershell
Get-Content $env:USERPROFILE\.engineering-standards\README.md
```

**Linux/macOS Commands:**
```bash
cat ~/.engineering-standards/README.md
```

The README contains:
- Setup instructions and directory structure requirements
- Recent updates and changes
- Links to additional documentation
- Contact information for questions

## 3. Verify Setup

After cloning, verify that the standards are accessible:

**Windows PowerShell:**
```powershell
Test-Path $env:USERPROFILE\.engineering-standards\skills
```

**Linux/macOS:**
```bash
ls ~/.engineering-standards/skills/
```

The cloned repository structure includes:
- `steering/` - AI tool steering documents
- `standards/` - Language and framework-specific standards
- `workflows/ai-development-lifecycle/` - Detailed AI-DLC workflow rules
- `skills/` - Portable AI skills for all tools

## 4. Updating Standards

To get the latest updates, pull changes and re-run setup:

**Windows PowerShell Commands:**
```powershell
cd $env:USERPROFILE\.engineering-standards
git pull
.\setup.ps1
```

**Linux/macOS Commands:**
```bash
cd ~/.engineering-standards
git pull
pwsh -File ./setup.ps1
```

## 5. Project Compliance (New and Existing Projects)

For **new projects**: Ensure the project follows the standard structure defined in the engineering standards repository.

For **existing projects (brownfield)**: 
- Review current project structure against Example Organization standards
- Identify areas that need to be brought into compliance
- Plan incremental updates to align with standards without disrupting existing functionality
- Focus on critical areas first: security practices, code style, and documentation
- Consider creating a compliance roadmap for gradual implementation

## 6. Brownfield Project Integration

For existing projects that need to adopt Example Organization engineering standards:

### Initial Assessment
Review the standards against your current project structure and identify gaps.

### Gradual Integration Strategy
1. **Phase 1 - Critical Standards**: Implement security and compliance requirements first
2. **Phase 2 - Code Quality**: Apply code style and testing standards to new code
3. **Phase 3 - Architecture**: Gradually refactor to align with architectural patterns
4. **Phase 4 - Documentation**: Update documentation to match standards

### Brownfield Considerations
- **Backward Compatibility**: Ensure changes don't break existing functionality
- **Incremental Adoption**: Apply standards to new code immediately, refactor existing code gradually
- **Team Training**: Ensure team understands new standards before implementation
- **Risk Assessment**: Identify high-risk areas that need careful migration planning

## Implementation Notes

When AI tool is asked to work with any project (new or existing):
1. Always reference this steering document first
2. Check if `~/.ai-tool/.git` exists (indicates repo is cloned)
3. If not present, follow section 1 to clone the repository
4. If present, consider running `git pull` to get latest updates (section 4)
5. Read the README from the standards repository
6. Apply appropriate standards based on project type and technology stack

**BROWNFIELD PROJECT WORKFLOW:**
- For existing projects, prioritize assessment and gradual integration over immediate full compliance
- Focus on critical security and compliance standards first
- Apply new standards to new code immediately while planning migration for existing code
- Use the engineering standards as a roadmap for continuous improvement

**EXECUTION FLOW CONTROL:**
- The steering document setup process should be completed as a separate, isolated task
- After cloning or updating the repository, provide a brief confirmation message
- **NEVER automatically start AI-DLC, workspace detection, or ANY other workflows** - wait for explicit user instruction
- DO NOT ask "what would you like to build?" or similar prompts - just confirm completion and stop
- Additional project setup steps should be handled as separate requests to ensure proper application of the steering guidelines

**MANUAL UPDATES:**
- Periodically check for updates to engineering standards by running `git pull` in the repository
- Consider setting reminders to check for updates monthly or quarterly
- Stay informed about changes through team communications and announcements

This ensures all projects (new and existing) start with or migrate to the correct foundation and stay current with Example Organization's established engineering practices.
