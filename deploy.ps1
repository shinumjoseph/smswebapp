Import-Module WebAdministration

$publishFolder = "C:\ProgramData\Jenkins\.jenkins\workspace\smswebapp\publish"
$destination = "C:\DevOps Projects\smswebapp"

Write-Host "Stopping IIS Website..."
Stop-WebSite -Name "smswebapp"

Write-Host "Cleaning deployment folder..."
if (Test-Path $destination) {
    Remove-Item "$destination\*" -Recurse -Force
} else {
    New-Item -ItemType Directory -Path $destination
}

Write-Host "Copying published files..."
Copy-Item "$publishFolder\*" $destination -Recurse -Force

Write-Host "Starting IIS Website..."
Start-WebSite -Name "smswebapp"

Write-Host "Deployment completed."
