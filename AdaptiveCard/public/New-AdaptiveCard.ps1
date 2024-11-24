function New-AdaptiveCard {
    $AdaptiveCard = @{
        type        = "AdaptiveCard"
        attachments = @(
            @{
                contentType = "application/vnd.microsoft.card.adaptive"
                content     = @{
                    type      = "AdaptiveCard"
                    '$schema' = "https://adaptivecards.io/schemas/adaptive-card.json"
                    version   = "1.5"
                    msteams   = @{
                        width = "Full"
                    }
                    body      = @( )
                }
            }
        )
    }
    return $AdaptiveCard
}
