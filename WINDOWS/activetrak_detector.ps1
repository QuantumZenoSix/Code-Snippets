# Quick ActivTrak detection - run in PowerShell (elevated if possible)

$found = $false
$messages = @()

# 1. Check for the SVCTCOM service (most reliable indicator)
$service = Get-Service -Name "SVCTCOM" -ErrorAction SilentlyContinue
if ($service) {
    $found = $true
    $messages += "Found SVCTCOM service (Status: $($service.Status))"
}

# 2. Check for trmhost.exe process
$process = Get-Process -Name "trmhost" -ErrorAction SilentlyContinue
if ($process) {
    $found = $true
    $messages += "Found trmhost.exe process running"
}

# 3. Check common uninstall registry keys for "ActivTrak Agent"
$uninstallPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
)

foreach ($path in $uninstallPaths) {
    if (Test-Path $path) {
        $keys = Get-ChildItem -Path $path -ErrorAction SilentlyContinue | 
                Where-Object { (Get-ItemProperty -Path $_.PSPath -ErrorAction SilentlyContinue).DisplayName -like "*ActivTrak*" }
        if ($keys) {
            $found = $true
            $messages += "Found ActivTrak in registry uninstall keys"
            break
        }
    }
}

# Final output
if ($found) {
    Write-Host "ActivTrak Agent appears to be INSTALLED." -ForegroundColor Yellow
    if ($messages.Count -gt 0) {
        Write-Host "Evidence found:"
        $messages | ForEach-Object { Write-Host "  - $_" }
    }
} else {
    Write-Host "No clear signs of ActivTrak Agent were found." -ForegroundColor Green
    Write-Host "(It may still be present under a hidden/renamed install — but these are the most common detection points)"
}