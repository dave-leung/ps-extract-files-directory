$srcPath = ""
$destPath = ""

# create directory if $destPath is not exist
If (-not (Test-Path $destPath)) {
  Write-Host "Destination path $destPath does not exist"
  New-Item -ItemType Directory -Force -Path $destPath
}

# get zip files from $srcPath
$zipFiles = Get-ChildItem -Path $srcPath -Filter "*.zip" -Recurse -File

# validate if $srcPath include zip file, quit if not exist
if ($null -eq $zipFiles) {
  Write-Host "No zip file was found in $srcPath"
  return
}

Write-Host "Found ($($zipFiles.Count)) zip file(s). Start extraction" -ForegroundColor Cyan

# extract .zip file to $destPath
foreach ($zipFile in $zipFiles) {
  $folderName = $zipFile.BaseName
  $newDestPath = Join-Path -Path $destPath -ChildPath $folderName

  Write-Host "Extracting '$($zipFile.FullName)'... " -ForegroundColor Green

  if (Test-Path -Path $newDestPath) {
    $existingItem = Get-Item -Path $newDestPath
    if (-not $existingItem.PSIsContainer) {
      Write-Warming "Deleting conflict file to proceed"
      Remove-Item -LiteralPath $existingItem.FullName -Force
    }
  }

  Write-Host "Extracting archive '$($zipFile.FullName)'"
  Expand-Archive -LiteralPath $zipFile.FullName -DestinationPath $newDestPath
}

Write-Host "Extraction Completed" -ForegroundColor Green
