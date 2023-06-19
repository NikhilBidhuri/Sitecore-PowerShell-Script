# To upload CSV and Create Item and Update Fields for 3 coloums ItemName,ItemKey,ItemValue


$dataFolder = [Sitecore.Configuration.Settings]::DataFolder
$tempFolder = $dataFolder + "\temp\upload"
$filePath = Receive-File -Path $tempFolder

 


$importRows = Import-CSV $filePath
foreach ($row in $importRows)
    {
        $itemName = $row.ItemName
        $itemKey = $row.ItemKey
        $itemValue = $row.ItemValue
        $newItem = New-Item -Path "master://NewItemPath" -Name $itemName -ItemType "//TemplatePath"
        $Item = Get-Item -Path $newItem.Paths.Path
        $Item.Editing.BeginEdit()
        $Item.Fields["Key"].Value = $itemKey
        $Item.Fields["Value"].Value = $itemValue
        $item.Editing.EndEdit()
    }
