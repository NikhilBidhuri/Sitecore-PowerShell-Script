#Script to Remove Language Version 


$masterPath ="master:"

$dataFolder = [Sitecore.Configuration.Settings]::DataFolder
$tempFolder = $dataFolder + "\temp\upload"
$filePath = Receive-File -Path $tempFolder




$importCSVData = Import-CSV $filePath


foreach ($row in $importCSVData) {
    
     
        
        $itemPath = $masterPath + $row.Path
        $itemMain = Get-Item -Path $itemPath
        $itemChild= Get-ChildItem -Path $itemPath -recurse 
        $itemChild = $itemChild + $itemMain
       foreach ($version in $itemChild.Versions.GetVersions($true))
        {
            if ($version.Language -notcontains "en" -AND $version.Language -notcontains "ar")
            {
                Remove-ItemVersion $version
                Write-Host $version.ID " - " $version.Language "- deleted"
                $version;
            }

        }
}
