compare all fields
$globalItem = get-item "master:/sitecore/content/"
$otherItem = get-item "master:/sitecore/content/"

foreach($field in $globalItem.fields)
{
   if($otherItem.fields[$field.Name] -ne $field)
   {
       $field.Value
   }
    
}
