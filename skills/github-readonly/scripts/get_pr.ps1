param(
    [Parameter(Mandatory)]
    [string]$Repo,

    [Parameter(Mandatory)]
    [int]$PullRequestNumber
)

$ErrorActionPreference = "Stop"

gh pr view $PullRequestNumber --repo $Repo --json number,title,state,body,author,baseRefName,headRefName,commits,files,reviews,statusCheckRollup,url
