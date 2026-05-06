param(
    [Parameter(Mandatory=$false)]
    [string]$Owner = $env:GITHUB_OWNER
)

$ErrorActionPreference = "Stop"

if (-not $Owner) {
    throw "Owner is required. Set GITHUB_OWNER environment variable or pass -Owner parameter."
}

gh repo list $Owner --limit 100 --json name,description,url,stargazerCount,updatedAt
