param(
    [switch]$DryRun
)

$RepoRoot = $PSScriptRoot

Write-Host "--- Personal AI Standards Setup ---" -ForegroundColor Cyan

function Deploy-Symlink {
    param([string]$Source, [string]$Target)
    $TargetDir = Split-Path $Target -Parent
    if (-not (Test-Path $TargetDir)) {
        Write-Host "  Creating: $TargetDir"
        if (-not $DryRun) { New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null }
    }
    if (Test-Path $Target) {
        Write-Host "  Removing: $Target"
        if (-not $DryRun) { Remove-Item $Target -Force }
    }
    Write-Host "  Link: $Source -> $Target"
    if (-not $DryRun) { New-Item -ItemType SymbolicLink -Path $Target -Target $Source -Force | Out-Null }
}

# --- Gemini ---
Write-Host "`nDeploying to Gemini..." -ForegroundColor Yellow
$GeminiRoot = "$env:USERPROFILE\.gemini-cli"
if (-not (Test-Path $GeminiRoot)) {
    if (-not $DryRun) { New-Item -ItemType Directory -Path $GeminiRoot -Force | Out-Null }
}
Deploy-Symlink "$RepoRoot\steering\core-workflow.md" "$GeminiRoot\GEMINI.md"

# --- Claude Code ---
Write-Host "`nDeploying to Claude Code..." -ForegroundColor Yellow
$ClaudeRoot = "$env:USERPROFILE\.claude"
if (-not (Test-Path $ClaudeRoot)) {
    if (-not $DryRun) { New-Item -ItemType Directory -Path $ClaudeRoot -Force | Out-Null }
}

# Deploy core workflow as global CLAUDE.md
Deploy-Symlink "$RepoRoot\steering\core-workflow.md" "$ClaudeRoot\CLAUDE.md"

# Deploy skills as commands
$CommandsDir = "$ClaudeRoot\commands"
if (-not (Test-Path $CommandsDir)) {
    if (-not $DryRun) { New-Item -ItemType Directory -Path $CommandsDir -Force | Out-Null }
}

Get-ChildItem "$RepoRoot\skills" -Directory | ForEach-Object {
    $SkillFile = Join-Path $_.FullName "SKILL.md"
    if (Test-Path $SkillFile) {
        Deploy-Symlink $SkillFile "$CommandsDir\$($_.Name).md"
    }
}

Write-Host "`nSetup Complete." -ForegroundColor Green
