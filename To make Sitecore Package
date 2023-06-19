# Put item path in //Path 

$Items = @(
@{ Recursive = $TRUE; Source = "//Path"});

$ErrorActionPreference = "Stop"

$Package = New-Package -Name "//Name";
$Package.Sources.Clear();
$Package.Metadata.Publisher = "Nikhil";

ForEach ($Item in $Items)
{
  if ($Item.Recursive)
  {
    $Source = Get-Item $Item.Source | New-ItemSource -Name "N/A" 
    $Package.Sources.Add($Source);
  }
  else
  {
    $Source = Get-Item $Item.Source | New-ExplicitItemSource -Name "N/A" 
    $Package.Sources.Add($Source);
  }
}

# Save and Download Package
Export-Package -Project $package -Path "$( $package.Name ) - $( $package.Metadata.Version ).zip" -Zip
Download-File "$SitecorePackageFolder\$( $package.Name ) - $( $package.Metadata.Version ).zip"
