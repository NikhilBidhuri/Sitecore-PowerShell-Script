#Scrip to copy only link field from english version of item and paste it in arabic verison of same field.


$Items = Get-ChildItem master:"//Path" -recurse 
foreach ($item in $Items)
{
    $LinkFieldEnglish = $item.Fields | where {$_.Type -eq 'General Link' -AND $_.Language -eq "en"}
    $ItemArabic = Get-Item -Path $item.Paths.Path -Language "ar"
    
   
		foreach($field in $LinkFieldEnglish)
		{
			$new = $field.key
			$ItemArabic.Editing.BeginEdit() 
			$ItemArabic.Fields[$new].Value = $field.Value
			$ItemArabic.Editing.EndEdit()
		}
}
    
