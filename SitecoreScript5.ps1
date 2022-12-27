#  to transfer finalRendering to SharedRendering 



function Merge-Layout {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true,Position = 0,ValueFromPipeline = $true)]
        [item]$Item
    )

    process {
        $layoutField = New-Object "Sitecore.Data.Fields.LayoutField" -ArgumentList ($Item.Fields[[Sitecore.FieldIDs]::LayoutField]);
        $finalLayoutField = New-Object -TypeName "Sitecore.Data.Fields.LayoutField" -ArgumentList $Item.Fields[[Sitecore.FieldIDs]::FinalLayoutField]

        
        $finalLayoutDefinition = [Sitecore.Layouts.LayoutDefinition]::Parse($finalLayoutField.Value)

        $Item."__Renderings" = $finalLayoutDefinition.ToXml();
        Write-Host $finalLayoutDefinition.ToXml();
        Reset-ItemField -Item $Item -Name "__Final Renderings" -IncludeStandardFields
        
    }
}
Get-Item "master:/sitecore/content/SaudiaWebApp/Home/checkIn/checkInoverview" | Merge-Layout