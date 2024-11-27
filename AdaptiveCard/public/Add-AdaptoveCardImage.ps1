<#
.SYNOPSIS
    Adds an image element to an Adaptive Card object.

.DESCRIPTION
    The Add-AdaptiveCardImage function adds an image element to an existing Adaptive Card object.
    It supports various image properties including size, dimensions, alignment, style, and spacing.

.PARAMETER AdaptiveCard
    Required. The Adaptive Card object to which the image will be added.
    This should be an existing card object with a valid structure containing attachments[0].content.body.

.PARAMETER Url
    Required. The URL of the image to be added to the card.
    Must be a valid URL pointing to an accessible image resource.

.PARAMETER AltText
    Optional. Alternative text for the image, useful for accessibility.
    This text will be read by screen readers or displayed if the image fails to load.

.PARAMETER Size
    Optional. Predefined size of the image.
    Valid values: "auto", "stretch", "small", "medium", "large"
    Default: Not set, image will use its natural size

.PARAMETER Width
    Optional. Custom width of the image in pixels.
    Example: "100px"

.PARAMETER Height
    Optional. Custom height of the image in pixels.
    Example: "100px"

.PARAMETER HAlign
    Optional. Horizontal alignment of the image.
    Valid values: "left", "center", "right"
    Default: Not set, image will use default alignment

.PARAMETER Style
    Optional. Style of the image.
    Valid values: "default", "person"
    Default: "default"

.PARAMETER Spacing
    Optional. Spacing around the image element.
    Valid values: "default", "none", "small", "medium", "large", "extraLarge", "padding"
    Default: "default"

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardImage -AdaptiveCard $AdaptiveCard -Url "https://example.com/image.jpg"

    Adds an image to the card using default settings.

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardImage -AdaptiveCard $AdaptiveCard -Url "https://example.com/image.jpg" -Size "medium" -HAlign "center" -AltText "Company Logo"

    Adds a centered medium-sized image with alternative text.

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardImage -AdaptiveCard $AdaptiveCard -Url "https://example.com/image.jpg" -Width "200px" -Height "150px" -Spacing "large"

    Adds an image with custom dimensions and large spacing.

.NOTES
    This function modifies the input AdaptiveCard object directly by adding the image to its body.
    Make sure the AdaptiveCard object has the correct structure before using this function.
#>

function Add-AdaptiveCardImage {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [Parameter(Mandatory)]
        [string]$Url,
        [string]$AltText,
        [ValidateSet("auto", "stretch", "small", "medium", "large")]
        [string]$Size,
        [string]$Width, # px
        [string]$Height, # px
        [ValidateSet("left", "center", "right")]
        [string]$HAlign,
        [ValidateSet("default", "person")]
        [string]$Style,
        [ValidateSet("default", "none", "small", "medium", "large", "extraLarge", "padding")]
        [string]$Spacing
    )

    $imageObject = @{
        type = "Image"
        url  = $Url
    }

    if ($PSBoundParameters.ContainsKey('AltText')) {
        $imageObject.altText = $AltText
    }

    if ($PSBoundParameters.ContainsKey('Size')) {
        $imageObject.size = $Size
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

    if ($PSBoundParameters.ContainsKey('Style')) {
        $imageObject.style = $Style
    }

    if ($PSBoundParameters.ContainsKey('Spacing')) {
        $imageObject.spacing = $Spacing
    }

    $AdaptiveCard.attachments[0].content.body += $imageObject
}
