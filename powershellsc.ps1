$parentPath="/sitecore/Forms/SaudiAirlines/SaudiAirlines"
$query = "fast:"+$parentPath + "//*[@@templateid='{6ABEE1F2-4AB4-47F0-AD8B-BDB36F37F64C}']"
$Results = @();
$items = Get-Item -Path master: -Query $query -language "en"
#$items = Get-Item -Path master: -ID "{418372EE-7A31-4EA0-8C5E-3C34C80A530B}" -language "en"
foreach($item in $items)
{
    $subItems=$item.Axes.GetDescendants() |
         ? { $_.templateid -ne "{8CDDB194-F456-4A75-89B7-346F8F39F95C}" }
    foreach($subItem in $subItems)
    {
        switch($subItem.TemplateName)
        {
            "Text"
            {
                $FieldName=$subItem.Name
                $FieldValue=$subItem["text"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "Date"
            {
                 $FieldName=$subItem.Name
                $FieldValue=$subItem["title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "Button"
            {
                $FieldName=$subItem.Name
                $FieldValue=$subItem["title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "Input"
            {
                 $FieldName=$subItem.Name
                $FieldValue=$subItem["title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "RawHtmlField"
            {
                 $FieldName=$subItem.Name
                $FieldValue=$subItem["html"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "Multiple-Line Text"
            {
                $FieldName=$subItem.Name
                $FieldValue=$subItem["title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "Dropdown List"
            {
                [string]$dropdownValues = ''
           $dropdownValueItems=$subItem.Axes.GetDescendants() |
        ? { $_.templateid -eq "{B3BDFE59-6667-4432-B261-05D0E3F7FDF6}" }
           foreach($item1 in $dropdownValueItems)
           {
               if($dropdownValues -ne '')
            {
                $dropdownValues=$dropdownValues +"," + $item1.Fields["value"]
                
            }
            else
            {
                $dropdownValues=$item1.Fields["value"]
            }
              
           }
           $FieldName=$subItem["title"]
           $FieldValue=$dropdownValues
           $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
            }
            "Email"
            {
                 $FieldName=$subItem.Name
                $FieldValue=$subItem["title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "List"
            {
                $FieldName=$subItem.Name
                $FieldValue=$subItem["Title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
            "List Box"
            {
                 $FieldName=$subItem.Name
                $FieldValue=$subItem["Title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
             "Number"
            {
                 $FieldName=$subItem.Name
                $FieldValue=$subItem["title"]
                $Property = @{ 
FormName=$item.Name 
TemplateName=$subItem.TemplateName
FieldName=$FieldName
FieldValue=$FieldValue
        }
$Results += New-Object psobject -Property $Property
            }
             default {
            break 
        }
          
        }
         
       
        
    }
}
