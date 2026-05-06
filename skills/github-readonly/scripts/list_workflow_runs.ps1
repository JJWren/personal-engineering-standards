param(
    [Parameter(Mandatory=$true)]
    [string]$Repo
)

$ErrorActionPreference = "Stop"

gh run list --repo $Repo --limit 10 --json databaseId,workflowName,status,conclusion,createdAt,url
