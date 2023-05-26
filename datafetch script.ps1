$Results = @()
$DataPath = "C:\Test\test.csv"
$rootItem = "master:/sitecore/content/SaudiaWebApp/home/Fare Detail/Page Components" 

Get-ChildItem $rootItem -Language * -Recurse | ForEach-Object {
    $currentItem = $_
    Get-ItemField -Item $currentItem -ReturnType Field -Name "*" `
    | ForEach-Object{ 
         $Properties = @{
                    Item=$currentItem.name
                    Language=$_.Language
                    Name =  $_.Name
                    Value = $_.Value
                }
                $Results += New-Object psobject -Property $Properties
    }
}
$Results | Select-Object Item,Language,Name,Value | Export-Csv -notypeinformation -Path $DataPath
