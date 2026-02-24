# 1. Elevate privilege
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# 2. Set Variables
$f = "C:\Windows\System32\GameBarPresenceWriter.exe"
$b = "C:\Windows\System32\GameBarPresenceWriter.exe.bak"

Write-Host "--- PC Stutter Fix Tool ---" -ForegroundColor Magenta

# 3. Main Logic
if (Test-Path $f) {
    try {
        Write-Host "Taking ownership..." -ForegroundColor Cyan
        takeown /f $f /a | Out-Null
        
        Write-Host "Granting permissions..." -ForegroundColor Cyan
        icacls $f /grant administrators:F | Out-Null
        
        Write-Host "Renaming file..." -ForegroundColor Cyan
        Rename-Item -Path $f -NewName "GameBarPresenceWriter.exe.bak" -Force
        
        Write-Host "SUCCESS: GameBarPresenceWriter disabled." -ForegroundColor Green
    }
    catch {
        Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    }
}
elseif (Test-Path $b) {
    Write-Host "ALREADY DONE: File is already renamed." -ForegroundColor Yellow
}
else {
    Write-Host "NOT FOUND: File does not exist." -ForegroundColor Red
}

# 4. Wait for user
Write-Host ""
Write-Host "Press ENTER to exit..."
Read-Host