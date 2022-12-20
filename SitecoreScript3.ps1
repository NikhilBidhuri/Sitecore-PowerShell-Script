# Script to find item modified by a user in last (X) days 
# For created items use "__Created By"







$path ="master:/Path"
$items = Get-ChildItem -Path $path -Recurse | 
            Where-Object { $_.__Updated -gt [datetime]::Now.AddDays(-X) -and $_."__Updated By" -eq "sitecore\Nikhil" } 

ForEach ($item in $items) 
{
    Write-Host $item.Paths.Path $item.Count
}

