$CSVfilePath ="C:\Users\NDALOG1\Downloads\MediaScript.csv"
$CSVfilePath = Receive-File -Path $tempFolder
$template = Get-Item "/sitecore/templates/System/Media/Unversioned/Jpeg"

 
$sitecoreRootPath = "master:/sitecore/media library/SaudiaWebAppRebrandGreen"
$mediaLibraryRoot = Get-Item -Path $sitecoreRootPath
$csvData = Import-Csv $CSVfilePath

function Upload-MediaItems {
    param($physicalPath, $sitecorePath)
    $mediaItem = New-Item -Path $sitecorePath -ItemType $template.Paths.FullPath -Value $physicalPath -Force
    
    [Sitecore.Data.Items.MediaItem]$item = $sitecorePath
    [Sitecore.Resources.Media.Media] $media = [Sitecore.Resources.Media.MediaManager]::GetMedia($item);
    $extension = [System.IO.Path]::GetExtension($physicalPath);
    $stream = New-Object -TypeName System.IO.FileStream -ArgumentList $physicalPath, "Open", "Read"
    $media.SetStream($stream, $extension);
    $stream.Close();
    
    Write-Host "Uploaded"
}


foreach ($row in $csvData) {
    $name = $row.ItemName
    $physicalPath = $row.FilePath
    $sitecorePath = $sitecoreRootPath + "/" + $name
    Upload-MediaItems -physicalPath $physicalPath -sitecorePath $sitecorePath
}
