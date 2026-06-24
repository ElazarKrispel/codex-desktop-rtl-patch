<#
.SYNOPSIS
    Remove the Codex RTL patch: the patched copy, shortcut, watcher task and state.
    The original Microsoft Store Codex is not affected.
#>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Continue'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $scriptDir 'lib\codex-rtl-lib.ps1')

Start-RtlInstallLog 'uninstall' | Out-Null

if (Test-CodexRtlRunning) { throw "Codex (RTL) is running. Close it, then re-run." }

Unregister-CodexRtlWatcher

foreach ($d in @($script:CopyRoot, $script:Staging, $script:OldRoot, $script:BinDir)) {
    if (Test-Path $d) {
        try { Remove-Item -LiteralPath $d -Recurse -Force; Write-RtlLog "removed $d" }
        catch { Write-RtlLog "could not remove $d : $($_.Exception.Message)" }
    }
}
# Remove both current shortcuts (Start + Desktop) and any legacy-named ones.
foreach ($lnk in $script:ShortcutPaths) {
    if (Test-Path $lnk) { try { Remove-Item -LiteralPath $lnk -Force; Write-RtlLog "removed $lnk" } catch {} }
}
if (Test-Path $script:StateFile) { Remove-Item -LiteralPath $script:StateFile -Force }
# Note: the logs folder ($script:LogsDir) is intentionally kept for diagnostics.

Write-Host "[OK] Uninstalled. The original Microsoft Store Codex is unaffected." -ForegroundColor Green
Write-Host "     (Logs kept at $($script:LogsDir).)" -ForegroundColor DarkGray
