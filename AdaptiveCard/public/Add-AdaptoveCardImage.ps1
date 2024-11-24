function Add-AdaptiveCardImage {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [Parameter(Mandatory)]
        [string]$Url,
        [string]$AltText = "",
        [string]$Size = "auto", # auto, stretch, small, medium, large
        [string]$Width, # px
        [string]$Height, # px
        [string]$HAlign, # left, center, right
        [string]$Style = "default", # default, person
        [string]$Spacing = "default" # default, none, small, medium, large, extraLarge, padding
    )

    $imageObject = @{
        type = "Image"
        url  = $Url
        size = $Size
        style = $Style
        spacing = $Spacing
        altText = $AltText
    }

    if ($PSBoundParameters.ContainsKey('Width')) {
        $imageObject.width = $Width
    }
    if ($PSBoundParameters.ContainsKey('Height')) {
        $imageObject.height = $Height
    }
    if ($PSBoundParameters.ContainsKey('HAlign')) {
        $imageObject.horizontalAlignment = $HAlign
    }

    $AdaptiveCard.attachments[0].content.body += $imageObject
}
