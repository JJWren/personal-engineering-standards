param(
    [switch]$DryRun
)

$RepoRoot = $PSScriptRoot
$TargetTools = @{
    "Gemini" = "$env:USERPROFILE\.gemini-cli"
}

Write-Host "--- Portable Skills Sync ---" -ForegroundColor Cyan

$Skills = Get-ChildItem -Path "$RepoRoot\skills" -Directory

foreach ($Tool in $TargetTools.Keys) {
    $ToolPath = $TargetTools[$Tool]
    $ToolSkillsPath = Join-Path $ToolPath "skills"
    
    if (-not (Test-Path $ToolSkillsPath)) {
        Write-Host "Creating skills directory for $($Tool): $ToolSkillsPath"
        if (-not $DryRun) { New-Item -ItemType Directory -Path $ToolSkillsPath -Force }
    }

    foreach ($Skill in $Skills) {
        $Source = $Skill.FullName
        $Target = Join-Path $ToolSkillsPath $Skill.Name
        
        if (Test-Path $Target) {
            if ($DryRun) { Write-Host "[DryRun] Would refresh link: $Target" }
            # For symlinks to directories, we check if it's already a link or needs updating
        } else {
            Write-Host "Linking Skill [$($Skill.Name)] for $Tool"
            if (-not $DryRun) {
                New-Item -ItemType SymbolicLink -Path $Target -Target $Source -Force
            }
        }
    }
}

Write-Host "`nSync Complete. All expert skills are now available in your AI tools." -ForegroundColor Green
