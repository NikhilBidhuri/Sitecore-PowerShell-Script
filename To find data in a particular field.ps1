# Requirement  : we want to fetch all items which has letter X splited by . in field of item
# like we have 4 items and in field we have value (X.Nikhil) , (X.Ram) , (Y.Nikhil) , (Y.Ram)
# so this will get only first two



# Get-ChildItem will get Child items of given path
# recurce will make Get-ChildItem to repeat in sub directories
# Pipeline(|) connects series of commands 
# Where-Object will give where condition plus conditions 
# $_. refers current object or context object
# Fields will get field of sitecore Item
# Value will get value of sitecore item field
# Spilt will split the value by given parameter
# -contains will check if value contains the givin parameter 
# foreach loop will give result for each item in Items 
# For Path we use Path.Paths
# For Name we use .Name
# For GUID we use .ID




$Items = Get-ChildItem master:"/Path" -recurse | Where-Object {$_.Fields["messageID"].Value.Split(".") -contains ("X")}
foreach ($item in $Items)
{
	$item.Path.Paths
}


