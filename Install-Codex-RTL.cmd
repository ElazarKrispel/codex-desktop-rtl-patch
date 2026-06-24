@echo off
rem ============================================================================
rem  Codex RTL - friendly graphical installer (Hebrew / right-to-left support).
rem  Delegates to the VBS launcher so NO PowerShell/console window appears.
rem  (Double-clicking Install-Codex-RTL.vbs directly is just as good.)
rem ============================================================================
start "" wscript.exe //nologo "%~dp0Install-Codex-RTL.vbs"
