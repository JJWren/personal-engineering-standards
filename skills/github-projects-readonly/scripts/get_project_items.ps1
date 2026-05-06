param(
    [Parameter(Mandatory=$false)]
    [int]$ProjectNumber = $env:GITHUB_PROJECT_NUMBER,

    [Parameter(Mandatory=$false)]
    [string]$Owner = $env:GITHUB_OWNER
)

$ErrorActionPreference = "Stop"

if (-not $ProjectNumber) {
    throw "ProjectNumber is required. Set GITHUB_PROJECT_NUMBER environment variable or pass -ProjectNumber parameter."
}

if (-not $Owner) {
    throw "Owner is required. Set GITHUB_OWNER environment variable or pass -Owner parameter."
}

gh project item-list $ProjectNumber --owner $Owner --limit 100 --format json
