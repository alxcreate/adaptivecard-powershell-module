function Send-AdaptiveCardToTeams {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [Parameter(Mandatory)]
        [string]$Workflow
    )
    $AdaptiveCardJson = $AdaptiveCard | ConvertTo-Json -Depth 10

    try {
        Invoke-RestMethod -Uri $Workflow -Method Post -Body $AdaptiveCardJson -ContentType 'application/json; charset=utf-8'
        Write-Output "Successfully posted to Teams channel"
    }
    catch {
        Write-Error "Error posting to Teams channel: $_"
    }
}
