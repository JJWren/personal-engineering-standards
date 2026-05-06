param(
    [Parameter(Mandatory)]
    [string]$Repo,

    [Parameter(Mandatory)]
    [int]$IssueNumber
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI is required. Install with winget install GitHub.cli"
}

gh issue view $IssueNumber --repo $Repo --json number,title,state,body,labels,assignees,milestone,projectItems,url
