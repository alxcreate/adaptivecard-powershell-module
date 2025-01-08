<#
.SYNOPSIS
    Adds a media element (video) to an Adaptive Card object.

.DESCRIPTION
    The Add-AdaptiveCardMedia function adds a media element (video) to an existing Adaptive Card object.
    It supports MP4 video format and allows configuration of various properties including poster image,
    alternative text, height, and spacing.

.PARAMETER AdaptiveCard
    Required. The Adaptive Card object to which the media element will be added.
    This should be an existing card object with a valid structure containing attachments[0].content.body.

.PARAMETER Url
    Required. The URL of the video to be added to the card.

.PARAMETER Poster
    Optional. URL of the poster image to be displayed before the video plays.
    This image serves as a thumbnail or preview for the video content.

    If poster is omitted:
    - The Media element will use a default poster controlled by the host application, or
    - Will attempt to automatically pull the poster from the target video service
      when the source URL points to a video from a Web provider such as YouTube.

.PARAMETER AltText
    Optional. Alternative text for the media element, useful for accessibility.
    This text will be read by screen readers or displayed if the media fails to load.

.PARAMETER Height
    Optional. Controls how the media element's height should behave.
    Valid values: "auto", "stretch"
    Default: Not set, media will use default height behavior

.PARAMETER Spacing
    Optional. Spacing around the media element.
    Valid values: "default", "none", "small", "medium", "large", "extraLarge", "padding"
    Default: "default"

.EXAMPLE
    $card = Get-AdaptiveCard
    Add-AdaptiveCardMedia -AdaptiveCard $card -Url "https://example.com/video.mp4"

    Adds a direct MP4 video to the card using default settings.

.EXAMPLE
    $card = Get-AdaptiveCard
    Add-AdaptiveCardMedia -AdaptiveCard $card -Url "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -Height "stretch"

    Adds a YouTube video with stretched height. The poster thumbnail will be automatically retrieved from YouTube.

.EXAMPLE
    $card = Get-AdaptiveCard
    Add-AdaptiveCardMedia -AdaptiveCard $card -Url "https://example.com/video.mp4" `
                         -Poster "https://storageaccount.blob.core.windows.net/container/thumbnail.jpg" `
                         -Height "auto"

    Adds a video with a poster image stored in Azure Blob Storage and automatic height adjustment.

.NOTES
    - This function modifies the input AdaptiveCard object directly by adding the media element to its body.
    - Currently supports only MP4 video format.
    - Make sure the AdaptiveCard object has the correct structure before using this function.
    - Ensure that the video URL points to a directly accessible MP4 file.
#>

function Add-AdaptiveCardMedia {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [Parameter(Mandatory)]
        [string]$Url,
        [string]$Poster,
        [string]$AltText,
        [ValidateSet("auto", "stretch")]
        [string]$Height,
        [ValidateSet("default", "none", "small", "medium", "large", "extraLarge", "padding")]
        [string]$Spacing
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

    if ($PSBoundParameters.ContainsKey('Height')) {
        $mediaObject.height = $Height
    }

    if ($PSBoundParameters.ContainsKey('Spacing')) {
        $mediaObject.spacing = $Spacing
    }

    $AdaptiveCard.attachments[0].content.body += $mediaObject
}
