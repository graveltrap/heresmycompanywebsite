# validate-demos.ps1 — guardrail check for every demo folder in the repo.
# A demo folder = any root-level directory containing index.html,
# except reserved folders below. Run from anywhere: pwsh -File docs\validate-demos.ps1
# Exit code 0 = all demos pass; 1 = violations found.

$repo = Split-Path $PSScriptRoot -Parent
$reserved = @('templates', 'docs', '.git')
$bannerText = 'DEMO CONCEPT: This is a private web proposal built by'
$noindexPattern = 'name="robots"\s+content="[^"]*noindex'
$robots = Get-Content (Join-Path $repo 'robots.txt') -Raw
$fail = @()

$demos = Get-ChildItem $repo -Directory | Where-Object { $reserved -notcontains $_.Name }
foreach ($d in $demos) {
    $idx = Join-Path $d.FullName 'index.html'
    if (-not (Test-Path $idx)) { $fail += "$($d.Name): missing index.html"; continue }
    $html = Get-Content $idx -Raw
    if ($html -notmatch [regex]::Escape($bannerText)) { $fail += "$($d.Name): missing DEMO CONCEPT banner" }
    if ($html -notmatch $noindexPattern)              { $fail += "$($d.Name): missing noindex robots meta" }
    if ($robots -notmatch [regex]::Escape("Disallow: /$($d.Name)/")) { $fail += "$($d.Name): missing robots.txt Disallow line" }
    if ($html -match '<img[^>]+src="https?://')      { $fail += "$($d.Name): hotlinked external image (scraped asset risk)" }
}

if ($fail.Count) {
    Write-Host "GUARDRAIL VIOLATIONS:" -ForegroundColor Red
    $fail | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
    exit 1
}
Write-Host "All $($demos.Count) demo folder(s) pass guardrail checks." -ForegroundColor Green
exit 0
