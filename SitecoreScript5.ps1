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

        # Reset-ItemField -Item $Item -Name "__Final Renderings" -IncludeStandardFields                        
       Reset-Layout -Path $Item.Paths.Path -FinalLayout -Language *                #this reset final layout for all language 
        Write-Host "Done"
    }
}
$sourcePath = "master://Path"
$items = Get-ChildItem -Path $sourcePath -Recurse
foreach($item in $items)
    {
        if ($item.TemplateId -eq "{31F6B468-D465-4CC9-9421-189B13A7A0EB}")
        {
            $item | Merge-Layout
        }
    }