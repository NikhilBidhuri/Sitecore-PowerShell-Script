#to find items without reference


$items = Get-ChildItem -Path 'master:/sitecore/content/SaudiaWebApp/Content/SaudiaCommon/WarningMessages/Checkin' -Recurse
$results = New-Object System.Collections.ArrayList

foreach ($item in $items) {
    $links = $item | Get-ItemReferrer

    if ($links.Count -eq 0) {
        [void]$results.Add($item)
    }
}

$results | Format-Table Name
