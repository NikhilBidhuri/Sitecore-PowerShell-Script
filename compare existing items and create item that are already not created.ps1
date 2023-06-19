$dataFolder = [Sitecore.Configuration.Settings]::DataFolder
$tempFolder = $dataFolder + "\temp\upload"
$filePath = Receive-File -Path $tempFolder
$StateItem = get-childitem -path "master:/sitecore/content/SaudiAirlines/SaudiAirlines/Data/States"
 


$importRows = Import-CSV $filePath
foreach ($row in $importRows)
    {
        $State = $row.State
        $Code = $row.Code
        $Country = $row.Country
		
		$existingStates = $StateItem | Where-Object { $_.Name -eq $row.State }
        if($existingStates -eq $null -or $existingStates.count -eq "0")
        {
            $newItem = New-Item -Path "master:/sitecore/content/SaudiAirlines/SaudiAirlines/Data/States" -Name $State -ItemType "/sitecore/templates/Project/SaudiAirlines/Content Types/Country/State"
			$Item = Get-Item -Path $newItem.Paths.Path
			$Item.Editing.BeginEdit()
			$Item.Fields["stateName"].Value = $itemKey
			$Item.Fields["stateCode"].Value = $Code
			$Item.Fields["country"].Value = $Country
			$item.Editing.EndEdit()
        }
		 
		   
}

        to compare existing items and create item that are already not created
    
