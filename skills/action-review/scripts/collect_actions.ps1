param(
    [Parameter(Mandatory=$false)]
    [string]$VaultPath = $env:PERSONAL_OBSIDIAN_VAULT,

    [Parameter(Mandatory=$false)]
    [int]$Days = 14
)

$ErrorActionPreference = "Stop"

if (-not $VaultPath) {
    throw "VaultPath is required. Set PERSONAL_OBSIDIAN_VAULT environment variable or pass -VaultPath parameter."
}

if (-not (Test-Path $VaultPath)) {
    throw "Obsidian vault path not found: $VaultPath"
}

$CutoffDate = (Get-Date).AddDays(-$Days)
$results = @()

# Find files modified within the cutoff period
$Files = Get-ChildItem -Path $VaultPath -Recurse -Include *.md | Where-Object { $_.LastWriteTime -ge $CutoffDate }

foreach ($File in $Files) {
    $Lines = Get-Content $File.FullName
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match "^\s*ACTION:\s*(.*)") {
            $results += [PSCustomObject]@{
                SourceFile   = $File.FullName
                RelativePath = $File.FullName.Replace($VaultPath, "").TrimStart("\")
                LineNumber   = $i + 1
                ActionText   = $matches[1].Trim()
                ModifiedTime = $File.LastWriteTime
            }
        }
    }
}

$results | Sort-Object ModifiedTime -Descending | ConvertTo-Json
