# Set the variables
$basePath = "hdfs/data"
$directoryName = "data1"
$filename_excel = "daily_market_price.xlsx"
$sourceDir = "local/data/market"
$targetDir = Join-Path -Path $basePath -ChildPath $directoryName

# Construct the full directory path
$fullPath = Join-Path -Path $basePath -ChildPath $directoryName

# Check if the directory exists
if (Test-Path -Path $fullPath -PathType Container) {
    Write-Host "There is $directoryName Directory Exists!"

    # Copy the file from source to target directory
    $sourceFile = Join-Path -Path $sourceDir -ChildPath $filename_excel
    $targetFile = Join-Path -Path $targetDir -ChildPath $filename_excel
    Copy-Item -Path $sourceFile -Destination $targetFile -Force

    if (Test-Path -Path $targetFile -PathType Leaf) {
        Write-Host "File copied successfully."
        $logContent = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - File Moved Successfully"
        $logPath = Join-Path -Path $targetDir -ChildPath "log.txt"
        $logContent | Set-Content -Path $logPath
    } else {
        Write-Host "Failed to copy the file."
    }

} else {
    Write-Host "$directoryName Directory Not Exists!"
    New-Item -Path $fullPath -ItemType Directory
    Write-Host "$directoryName Directory Created!"
}

# Create a scheduled task to run the script daily at 07:00 AM
$trigger = New-ScheduledTaskTrigger -At "07:00 AM" -Daily
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File "C:\Users\jafar\Downloads\Tugas Rakamin\challenge2.ps1"'
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CheckAndCopyTask" -Description "Script to check, create directory, and copy file"
