<#
.SYNOPSIS
    Adds a text block element to an Adaptive Card object.

.DESCRIPTION
    The Add-AdaptiveCardTextBlock function adds a formatted text block element to an existing Adaptive Card object.
    It supports various text formatting options including weight, size, color, spacing, font type, and alignment.
    The function allows for rich text formatting and layout control within Adaptive Cards.

.PARAMETER AdaptiveCard
    Required. The Adaptive Card object to which the text block will be added.
    This should be an existing card object with a valid structure containing attachments[0].content.body.

.PARAMETER Text
    Required. The text content to be displayed in the text block.
    Supports both plain text and limited markdown formatting.

.PARAMETER Weight
    Optional. The font weight of the text.
    Valid values: "default", "lighter", "bolder"
    Default: "default"

.PARAMETER Size
    Optional. The size of the text.
    Valid values: "default", "small", "medium", "large", "extraLarge"
    Default: "default"

.PARAMETER Color
    Optional. The color of the text.
    Valid values: "default", "dark", "light", "accent", "good", "warning", "attention"
    Default: "default"

.PARAMETER Spacing
    Optional. The spacing around the text block element.
    Valid values: "default", "none", "small", "medium", "large", "extraLarge", "padding"
    Default: "default"

.PARAMETER FontType
    Optional. The type of font to use for the text.
    Valid values: "default", "monospace"
    Default: "default"

.PARAMETER HAlign
    Optional. The horizontal alignment of the text.
    Valid values: "left", "center", "right"
    Default: "left"

.PARAMETER IsSubtle
    Optional. When set, displays the text in a subtle, muted style.
    Default: False

.PARAMETER MaxLines
    Optional. The maximum number of lines of text to display before truncating.
    Must be a positive integer.

.PARAMETER Wrap
    Optional. When set, allows the text to wrap onto multiple lines.
    Default: False

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardTextBlock -AdaptiveCard $AdaptiveCard -Text "Hello World"

    Adds a simple text block with default formatting.

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardTextBlock -AdaptiveCard $AdaptiveCard -Text "Important Message" `
                             -Size "large" -Weight "bolder" -Color "accent" `
                             -HAlign "center"

    Adds a large, bold, centered text block with accent color.

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardTextBlock -AdaptiveCard $AdaptiveCard `
                             -Text "This is a long text that needs to wrap onto multiple lines." `
                             -Wrap -MaxLines 3 -IsSubtle

    Adds a subtle text block that wraps text and limits display to 3 lines.

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardTextBlock -AdaptiveCard $AdaptiveCard `
                             -Text "```\nvar code = 'example';\n```" `
                             -FontType "monospace" -Size "small" `
                             -Spacing "large"

    Adds a code block using monospace font with increased spacing.

.NOTES
    - This function modifies the input AdaptiveCard object directly by adding the text block to its body.
    - Text blocks support limited markdown formatting including bold, italic, and code blocks.
    - When using the Wrap parameter, consider the display width of your card to ensure proper text wrapping.
    - The IsSubtle parameter is useful for secondary or less important text content.
    - Consider using appropriate combinations of Size and Weight for creating visual hierarchy.
#>

function Add-AdaptiveCardTextBlock {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [Parameter(Mandatory)]
        [string]$Text,
        [ValidateSet("default", "lighter", "bolder")]
        [string]$Weight,
        [ValidateSet("default", "small", "medium", "large", "extraLarge")]
        [string]$Size,
        [ValidateSet("default", "dark", "light", "accent", "good", "warning", "attention")]
        [string]$Color,
        [ValidateSet("default", "none", "small", "medium", "large", "extraLarge", "padding")]
        [string]$Spacing,
        [ValidateSet('default', 'monospace')]
        [string]$FontType,
        [ValidateSet('left', 'center', 'right')]
        [string]$HAlign,
        [switch]$IsSubtle,
        [int]$MaxLines,
        [switch]$Wrap
    )

    $textBlockObject = @{
        type = "TextBlock"
        text = "$($Text)"
    }

    if ($PSBoundParameters.ContainsKey('Weight')) {
        $textBlockObject.weight = $Weight
    }

    if ($PSBoundParameters.ContainsKey('Size')) {
        $textBlockObject.size = $Size
    }

    if ($PSBoundParameters.ContainsKey('Color')) {
        $textBlockObject.color = $Color
    }

    if ($PSBoundParameters.ContainsKey('Spacing')) {
        $textBlockObject.spacing = $Spacing
    }

    if ($PSBoundParameters.ContainsKey('FontType')) {
        $textBlockObject.fontType = $FontType
    }

    if ($PSBoundParameters.ContainsKey('HAlign')) {
        $textBlockObject.horizontalAlignment = $HAlign
    }

    if ($PSBoundParameters.ContainsKey('IsSubtle')) {
        $textBlockObject.isSubtle = $true
    }

    if ($PSBoundParameters.ContainsKey('MaxLines')) {
        $textBlockObject.maxLines = $MaxLines
    }

    if ($PSBoundParameters.ContainsKey('Wrap')) {
        $textBlockObject.wrap = $true
    }

    $AdaptiveCard.attachments[0].content.body += $textBlockObject
}
