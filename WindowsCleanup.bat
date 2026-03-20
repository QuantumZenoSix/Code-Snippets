@echo off
REM  ┌──────────────────────────────────────────────────────────────┐
REM  │ Turns off command echoing so the window stays clean and      │
REM  │ doesn't repeat every command line.                            │
REM  └──────────────────────────────────────────────────────────────┘

date /t & time /t
REM  Shows the current date and time (start timestamp)

echo.
echo === STEP 1: Aggressive Component Store Cleanup + Reset Base ===
echo DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
REM  - Removes superseded (old/outdated) component versions from WinSxS
REM  - /ResetBase permanently sets the CURRENT state as the new baseline
REM  - WARNING: After this succeeds, you can NO LONGER uninstall or roll back
REM    previous Windows Updates / feature updates → frees up several GB but irreversible
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase

echo.
echo ... finished cleanup / reset base
echo.

date /t & time /t
REM  Timestamp after cleanup step

echo.
echo === STEP 2: Quick corruption detection check ===
echo DISM /Online /Cleanup-Image /CheckHealth
REM  Very fast check — tells you if Windows has already DETECTED corruption
REM  (usually takes just a few seconds)
DISM /Online /Cleanup-Image /CheckHealth

echo.
echo ... checkhealth done
echo.

date /t & time /t

echo.
echo === STEP 3: Deeper corruption scan (no repair yet) ===
echo DISM /Online /Cleanup-Image /ScanHealth
REM  More thorough scan of the component store — actually verifies file integrity
REM  Takes longer (usually 2–10 minutes) but still only REPORTS — does NOT fix anything
DISM /Online /Cleanup-Image /ScanHealth

echo.
echo ... scanhealth done
echo.

date /t & time /t

echo.
echo === STEP 4: Repair the Windows component store ===
echo DISM /Online /Cleanup-Image /RestoreHealth
REM  The most important repair command:
REM This script is a "nuclear option" maintenance / repair + cleanup combo that people commonly run when they want to:
REM Fix corrupted system files / component store issues
REM Repair Windows Update problems
REM Reclaim disk space from old update files
REM Stabilize a sluggish or glitchy Windows installation
REM Order logic: It cleans up old components first → checks/scans/repairs the component store → finally fixes the actual running OS files with SFC.
REM It must be run from an elevated Command Prompt (Run as administrator), otherwise most of the commands will fail with permission errors.

REM  - Scans for corruption
REM  - Downloads clean replacement files from Windows Update (requires internet)
REM  - Replaces damaged/missing components
REM  This usually takes 10–40+ minutes depending on damage and connection
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo ... restorehealth done
echo.

date /t & time /t

echo.
echo === STEP 5: Repair protected system files on the live OS ===
echo SFC /scannow
REM  Scans ALL protected Windows system files
REM  Replaces corrupted, modified, or missing files using the (now hopefully clean)
REM  component store that DISM just repaired/fixed
REM  Typically takes 5–20 minutes
SFC /scannow

echo.
date /t & time /t
REM  Final timestamp — shows when everything completed

echo.
echo All maintenance steps completed.
echo Review the output above for any errors or "found corrupt files" messages.
echo.
pause
REM  Keeps the window open so you can read the results before it closes