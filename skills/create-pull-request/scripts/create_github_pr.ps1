param(
    [Parameter(Mandatory)]
    [string]$Repo,

    [Parameter(Mandatory)]
    [string]$Title,

    [Parameter(Mandatory)]
    [string]$Body,

    [Parameter(Mandatory)]
    [string]$BaseBranch,

    [Parameter(Mandatory)]
    [string]$HeadBranch
)

$ErrorActionPreference = "Stop"

Write-Host "This script creates a GitHub pull request. Use only after explicit user approval." -ForegroundColor Yellow

gh pr create --repo $Repo --title $Title --body $Body --base $BaseBranch --head $HeadBranch
