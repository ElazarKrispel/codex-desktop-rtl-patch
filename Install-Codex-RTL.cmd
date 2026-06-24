@echo off
rem ============================================================================
rem  Codex RTL - friendly graphical installer (Hebrew / right-to-left support)
rem  Double-click this file. No administrator rights are required.
rem  It opens the installer window and hides this console.
rem ============================================================================
start "" powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -STA -File "%~dp0scripts\Install-CodexRtlGui.ps1"
