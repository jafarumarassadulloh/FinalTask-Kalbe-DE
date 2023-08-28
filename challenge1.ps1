# Set the variables
$basePath = "hdfs/data"
$directoryName = "data1"

# Construct the full directory path
$fullPath = Join-Path -Path $basePath -ChildPath $directoryName

# Check if the directory exists
if (Test-Path -Path $fullPath -PathType Container) {
    Write-Host "There is $directoryName Directory Exists!"
} else {
    Write-Host "$directoryName Directory Not Exists!"
    New-Item -Path $fullPath -ItemType Directory
    Write-Host "$directoryName Directory Created!"
}

# Create a scheduled task to run the script daily at 07:00 AM
$trigger = New-ScheduledTaskTrigger -At "07:00 AM" -Daily
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File "C:\Users\jafar\Downloads\Tugas Rakamin\challenge1.ps1"'
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CheckDirectoryTask" -Description "Script to check and create directory"

