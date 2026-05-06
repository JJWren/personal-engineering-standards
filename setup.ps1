param(
    [switch]$DryRun
)

$RepoRoot = $PSScriptRoot
$TargetTools = @{
    "Gemini" = "$env:USERPROFILE\.gemini-cli"
    "Claude" = "$env:USERPROFILE\.claudecode"
}

Write-Host "--- Personal Engineering Standards Setup ---" -ForegroundColor Cyan

# 1. Ensure Target Directories Exist
foreach ($Tool in $TargetTools.Keys) {
    $Path = $TargetTools[$Tool]
    if (-not (Test-Path $Path)) {
        Write-Host "Creating directory for $($Tool): $Path"
        if (-not $DryRun) { New-Item -ItemType Directory -Path $Path -Force }
    }
}

# 2. Deploy Steering Files
Write-Host "`nDeploying Steering (Core Workflow)..." -ForegroundColor Yellow
$SteeringMap = @{
    "$RepoRoot\steering\core-workflow.md" = "$($TargetTools['Gemini'])\GEMINI.md"
}

foreach ($Source in $SteeringMap.Keys) {
    $Target = $SteeringMap[$Source]
    if (Test-Path $Target) {
        Write-Host "Removing existing file: $Target"
        if (-not $DryRun) { Remove-Item $Target -Force }
    }
    
    Write-Host "Linking $Source -> $Target"
    if (-not $DryRun) {
        New-Item -ItemType SymbolicLink -Path $Target -Target $Source -Force
    }
}

Write-Host "`nSetup Complete. Your AI tools are now linked to your standards repository." -ForegroundColor Green
