# PowerShell Script to Create Server Resource Pack ZIP
# Run this script from the minecraft_hopecubes directory

Write-Host "Creating server resource pack ZIP file..." -ForegroundColor Green

$sourceFolder = "hopecubes_resourcepack"
$zipFile = "hopecubes_resourcepack.zip"

# Check if source folder exists
if (-not (Test-Path $sourceFolder)) {
    Write-Host "Error: $sourceFolder not found!" -ForegroundColor Red
    exit 1
}

# Remove existing ZIP if it exists
if (Test-Path $zipFile) {
    Write-Host "Removing existing $zipFile..." -ForegroundColor Yellow
    Remove-Item $zipFile -Force
}

# Create ZIP file - change to source folder first to ensure correct structure
Write-Host "Compressing resource pack..." -ForegroundColor Cyan
Push-Location $sourceFolder
try {
    Compress-Archive -Path "*" -DestinationPath "..\$zipFile" -Force
} finally {
    Pop-Location
}

# Verify ZIP was created
if (Test-Path $zipFile) {
    $fileSize = (Get-Item $zipFile).Length / 1MB
    Write-Host "Success! Created $zipFile" -ForegroundColor Green
    Write-Host "File size: $([math]::Round($fileSize, 2)) MB" -ForegroundColor Cyan
    
    # Calculate SHA-1 hash
    Write-Host "`nCalculating SHA-1 hash..." -ForegroundColor Cyan
    $hash = (Get-FileHash -Path $zipFile -Algorithm SHA1).Hash.ToLower()
    Write-Host "SHA-1 Hash: $hash" -ForegroundColor Yellow
    Write-Host "`nCopy this hash to your server.properties file:" -ForegroundColor Green
    Write-Host "resource-pack-sha1=$hash" -ForegroundColor White
    
    Write-Host "`nNext steps:" -ForegroundColor Cyan
    Write-Host "1. Upload $zipFile to your web server" -ForegroundColor White
    Write-Host "2. Get the direct download URL" -ForegroundColor White
    Write-Host "3. Add to server.properties:" -ForegroundColor White
    Write-Host "   resource-pack=YOUR_URL_HERE" -ForegroundColor Yellow
    Write-Host "   resource-pack-sha1=$hash" -ForegroundColor Yellow
    Write-Host "   resource-pack-prompt=`"Your custom message here!`"" -ForegroundColor Yellow
} else {
    Write-Host "Error: Failed to create ZIP file!" -ForegroundColor Red
    exit 1
}

