$dataFolder = [Sitecore.Configuration.Settings]::DataFolder
$tempFolder = $dataFolder + "\temp\upload"
$filePath = Receive-File -Path $tempFolder
$importRows = Import-CSV $filePath

$langList = @("de","es","fr","it","tr","zh")

foreach ($row in $importRows)
{
    $english = $row.English
    $itemPath =$row.ItemPath
    


    foreach($lang in $langList)
{
   
    $currentItemEnglish = get-item -path $itemPath -language "en"
     $currentItem = get-item -path  $itemPath -language $lang
   if ($currentItemEnglish.fields["title"] -match $english)
   {
         Write-Host "Title Updated" $currentItem.Name
       switch ($currentItem.Language.Name) {
                                              
                                                
                                                "de" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["title"].Value = $row.de
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "es" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["title"].Value = $row.es
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "fr" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["title"].Value = $row.fr
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "it" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["title"].Value = $row.it
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "tr" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["title"].Value = $row.tr
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "zh" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["title"].Value = $row.zh
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                default {
                                                 break }
                                                
                             
       }
   }
       if ($currentItemEnglish.fields["description"] -match $english)
       {
           Write-Host "Description Updated" $currentItem.Name
           switch ($currentItem.Language.Name) {
                                              
                                                
                                                "de" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["description"].Value = $row.de
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "es" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["description"].Value = $row.es
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "fr" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["description"].Value = $row.fr
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "it" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["description"].Value = $row.it
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "tr" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["description"].Value = $row.tr
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                "zh" {
                                                 $currentItem.Editing.BeginEdit()
                                                 $currentItem.Fields["description"].Value = $row.zh
                                                 $currentItem.Editing.EndEdit()
                                                 break
                                                }
                                                default {
                                                 break }
                                                 
       }
    }
}
}
