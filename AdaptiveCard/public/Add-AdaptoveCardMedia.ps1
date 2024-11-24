function Add-AdaptiveCardMedia {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [Parameter(Mandatory)]
        [string]$Url,
        [string]$Poster,
        [string]$AltText,
        [string]$Height = "automatic", # automatic, stretch
        [string]$Spacing = "default" # default, none, small, medium, large, extraLarge, padding
    )

    $mediaObject = @{
        type = "Media"
        sources = @(
            @{
                mimeType = "video/mp4"
                url = $Url
            }
        )
        spacing = $Spacing
        height = $Height
    }

    if ($PSBoundParameters.ContainsKey('Poster')) {
        $mediaObject.poster = $Poster
    }
    if ($PSBoundParameters.ContainsKey('AltText')) {
        $mediaObject.altText = $AltText
    }

    $AdaptiveCard.attachments[0].content.body += $mediaObject
}
