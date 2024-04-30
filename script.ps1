$settingsPath = Join-Path -Path $PSScriptRoot -ChildPath "settings.json"
$global:scRoot = $null

function checkscPath {
    Write-Host "Checking scPath..."
    Write-Host "scPath value: $global:scRoot"
    $result = $true
    if (-not (Test-Path -Path $global:scRoot -PathType Container)) {
        Write-Error "The specified screenshot folder path does not exist."
        # Ask the user for input and save them in variables
        $global:scRoot = Read-Host "Enter the path for screenshot folder"
        set-settingsFile -scRoot $global:scRoot
        $result = $false
        return $result
    }

    return $result
}

function set-settingsFile {
    param (
        [string]$scRoot
    )

    $settings = @{
        "scRoot" = $scRoot
    }
    $settingsJson = $settings | ConvertTo-Json -Depth 4

    # Write the JSON string to the settings.ps1 file
    $settingsJson | Out-File -FilePath $settingsPath -Encoding UTF8

    Write-Host "Settings have been saved to settings.json file."
}

if (Test-Path -Path $settingsPath -PathType Leaf) {
    Write-Host "The settings.json file exists in the script root directory."
    # Import the settings from the JSON file into variables
    $settings = Get-Content -Path $settingsPath | ConvertFrom-Json
    $global:scRoot = $settings.scRoot
}
else {
    Write-Host "The settings.json file does not exist in the script root directory."
    # Ask the user for input and save them in variables
    $global:scRoot = Read-Host "Enter the path for screenshot folder"
    set-settingsFile -scRoot $global:scRoot
}

do {
    $checkResult = checkscPath
} while (-not $checkResult)



$imageFiles = Get-ChildItem -Path $global:scRoot -Filter "*.png" -File
foreach ($imageFile in $imageFiles) {
    Write-Host "Image file: $($imageFile.FullName)"
    # Process the image file here
    $lastEdited = $imageFile.LastWriteTime
    $month = $lastEdited.Month
    $year = $lastEdited.Year
    
    $folderName = "{0}-{1}" -f $year, $month
    $folderPath = Join-Path -Path $global:scRoot -ChildPath $folderName

    if (-not (Test-Path -Path $folderPath -PathType Container)) {
        Write-Host "Creating folder: $folderPath"
        New-Item -Path $folderPath -ItemType Directory | Out-Null
    }

    # Move the image file to the corresponding folder
    $destinationPath = Join-Path -Path $folderPath -ChildPath $imageFile.Name
    Move-Item -Path $imageFile.FullName -Destination $destinationPath

}