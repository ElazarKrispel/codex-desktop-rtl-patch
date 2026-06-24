<#
.SYNOPSIS
    Remove the Codex RTL patch: the patched copy, shortcuts, watcher and state.
    The original Microsoft Store Codex is not affected.
.PARAMETER PurgeLogs
    Also delete the logs folder (kept by default for diagnostics).
#>
[CmdletBinding()]
param([switch]$PurgeLogs)
$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir 'lib\codex-rtl-lib.ps1')

Start-RtlInstallLog 'uninstall' | Out-Null
Invoke-CodexRtlUninstall -PurgeLogs:$PurgeLogs

Write-Host "[OK] Uninstalled. The original Microsoft Store Codex is unaffected." -ForegroundColor Green
if (-not $PurgeLogs) { Write-Host "     (Logs kept at $($script:LogsDir).)" -ForegroundColor DarkGray }
