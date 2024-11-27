<#
.SYNOPSIS
Adds a rich text block with multiple formatted text segments to an Adaptive Card.

.DESCRIPTION
Creates a rich text block in an Adaptive Card that can contain up to 9 text segments, each with its own formatting options. Each segment can have different styles like weight, size, color, and various text decorations. The segments can also be made clickable with different action types.

.PARAMETER AdaptiveCard
The Adaptive Card object to modify.
Must be a valid Adaptive Card object.

.PARAMETER Spacing
Controls the spacing before this block.
Default: default
Values: default, none, small, medium, large, extraLarge, padding

.PARAMETER HAlign
Controls the horizontal alignment of this block.
Default: left
Values: left, center, right

.PARAMETER TextN
The text content for segment N (where N is 1-9).
Required for at least Text1.

.PARAMETER WeightN
The font weight for segment N.
Default: default
Values: default, lighter, bolder

.PARAMETER SizeN
The text size for segment N.
Default: default
Values: default, small, medium, large, extraLarge

.PARAMETER ColorN
The text color for segment N.
Default: default
Values: default, dark, light, accent, good, warning, attention

.PARAMETER SelectActionN
The action type when segment N is clicked.
Default: OpenUrl
Values: Execute, OpenUrl, Submit, ToggleVisibility

.PARAMETER UrlN
The URL to open when segment N is clicked (when using OpenUrl action).
Only used when SelectActionN is OpenUrl.

.PARAMETER FontTypeN
The font type for segment N.
Default: default
Values: default, monospace

.PARAMETER HighlightN
Highlights the background of segment N.
Switch parameter - use -HighlightN to enable.

.PARAMETER IsSubtleN
Makes the text in segment N more subtle.
Switch parameter - use -IsSubtleN to enable.

.PARAMETER ItalicN
Makes segment N italic.
Switch parameter - use -ItalicN to enable.

.PARAMETER StrikethroughN
Adds strikethrough to segment N.
Switch parameter - use -StrikethroughN to enable.

.PARAMETER UnderlineN
Underlines segment N.
Switch parameter - use -UnderlineN to enable.

.EXAMPLE
# Simple text with color
$AdaptiveCard = New-AdaptiveCard
Add-AdaptiveCardRichTextBlock -AdaptiveCard $AdaptiveCard -Text1 "Hello" -Color1 "accent"

.EXAMPLE
# Multiple segments with a link
$AdaptiveCard = New-AdaptiveCard
Add-AdaptiveCardRichTextBlock -AdaptiveCard $AdaptiveCard -Text1 "Click " -Text2 "here" -Url2 "https://example.com" -Underline2

.EXAMPLE
# Formatted text with multiple styles
$AdaptiveCard = New-AdaptiveCard
Add-AdaptiveCardRichTextBlock -AdaptiveCard $AdaptiveCard -Text1 "Important: " -Weight1 "bolder" -Color1 "attention" -Text2 "Please read" -Italic2

.NOTES
At least one text segment (Text1) must be provided.
The function supports up to 9 text segments.
Each segment can have its own independent formatting.
#>

function Add-AdaptiveCardRichTextBlock {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [ValidateSet('default', 'none', 'small', 'medium', 'large', 'extraLarge', 'padding')]
        [string]$Spacing,
        [ValidateSet('left', 'center', 'right')]
        [string]$HAlign,

        [Parameter(Mandatory)]
        [string]$Text1,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight1,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size1,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color1,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction1 = "OpenUrl",
        [string]$Url1,
        [ValidateSet('default', 'monospace')]
        [string]$FontType1,
        [switch]$Highlight1,
        [switch]$IsSubtle1,
        [switch]$Italic1,
        [switch]$Strikethrough1,
        [switch]$Underline1,

        [string]$Text2,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight2,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size2,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color2,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction2 = "OpenUrl",
        [string]$Url2,
        [ValidateSet('default', 'monospace')]
        [string]$FontType2,
        [switch]$Highlight2,
        [switch]$IsSubtle2,
        [switch]$Italic2,
        [switch]$Strikethrough2,
        [switch]$Underline2,

        [string]$Text3,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight3,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size3,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color3,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction3 = "OpenUrl",
        [string]$Url3,
        [ValidateSet('default', 'monospace')]
        [string]$FontType3,
        [switch]$Highlight3,
        [switch]$IsSubtle3,
        [switch]$Italic3,
        [switch]$Strikethrough3,
        [switch]$Underline3,

        [string]$Text4,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight4,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size4,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color4,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction4 = "OpenUrl",
        [string]$Url4,
        [ValidateSet('default', 'monospace')]
        [string]$FontType4,
        [switch]$Highlight4,
        [switch]$IsSubtle4,
        [switch]$Italic4,
        [switch]$Strikethrough4,
        [switch]$Underline4,

        [string]$Text5,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight5,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size5,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color5,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction5 = "OpenUrl",
        [string]$Url5,
        [ValidateSet('default', 'monospace')]
        [string]$FontType5,
        [switch]$Highlight5,
        [switch]$IsSubtle5,
        [switch]$Italic5,
        [switch]$Strikethrough5,
        [switch]$Underline5,

        [string]$Text6,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight6,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size6,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color6,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction6 = "OpenUrl",
        [string]$Url6,
        [ValidateSet('default', 'monospace')]
        [string]$FontType6,
        [switch]$Highlight6,
        [switch]$IsSubtle6,
        [switch]$Italic6,
        [switch]$Strikethrough6,
        [switch]$Underline6,

        [string]$Text7,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight7,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size7,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color7,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction7 = "OpenUrl",
        [string]$Url7,
        [ValidateSet('default', 'monospace')]
        [string]$FontType7,
        [switch]$Highlight7,
        [switch]$IsSubtle7,
        [switch]$Italic7,
        [switch]$Strikethrough7,
        [switch]$Underline7,

        [string]$Text8,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight8,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size8,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color8,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction8 = "OpenUrl",
        [string]$Url8,
        [ValidateSet('default', 'monospace')]
        [string]$FontType8,
        [switch]$Highlight8,
        [switch]$IsSubtle8,
        [switch]$Italic8,
        [switch]$Strikethrough8,
        [switch]$Underline8,

        [string]$Text9,
        [ValidateSet('default', 'lighter', 'bolder')]
        [string]$Weight9,
        [ValidateSet('default', 'small', 'medium', 'large', 'extraLarge')]
        [string]$Size9,
        [ValidateSet('default', 'dark', 'light', 'accent', 'good', 'warning', 'attention')]
        [string]$Color9,
        [ValidateSet('Execute', 'OpenUrl', 'Submit', 'ToggleVisibility')]
        [string]$SelectAction9 = "OpenUrl",
        [string]$Url9,
        [ValidateSet('default', 'monospace')]
        [string]$FontType9,
        [switch]$Highlight9,
        [switch]$IsSubtle9,
        [switch]$Italic9,
        [switch]$Strikethrough9,
        [switch]$Underline9
    )

    $inlines = @()

    function Add-TextRun {
        param(
            [string]$Text,
            [string]$Weight,
            [string]$Size,
            [string]$Color,
            [string]$SelectAction,
            [string]$Url,
            [string]$FontType,
            [bool]$Highlight,
            [bool]$IsSubtle,
            [bool]$Italic,
            [bool]$Strikethrough,
            [bool]$Underline
        )

        if (![string]::IsNullOrEmpty($Text)) {
            $textRun = @{
                type   = "TextRun"
                text   = $Text
            }

            if (![string]::IsNullOrEmpty($Weight)) {
                $textRun.weight = $Weight
            }

            if (![string]::IsNullOrEmpty($Size)) {
                $textRun.size = $Size
            }

            if (![string]::IsNullOrEmpty($Color)) {
                $textRun.color = $Color
            }

            if (![string]::IsNullOrEmpty($FontType)) {
                $textRun.fontType = $FontType
            }

            if ($Highlight) {
                $textRun.highlight = $Highlight
            }

            if (![string]::IsNullOrEmpty($Url)) {
                $textRun.selectAction = @{
                    type = "Action.$($SelectAction)"
                    url  = "$($Url)"
                }
            }

            if ($IsSubtle) {
                $textRun.isSubtle = $IsSubtle
            }

            if ($Italic) {
                $textRun.italic = $Italic
            }

            if ($Strikethrough) {
                $textRun.strikethrough = $Strikethrough
            }

            if ($Underline) {
                $textRun.underline = $Underline
            }

            return $textRun
        }
    }

    $textRun1 = Add-TextRun -Text $Text1 -Weight $Weight1 -Size $Size1 -Color $Color1 -SelectAction $SelectAction1 -Url $Url1 -FontType $FontType1 -Highlight $Highlight1 -IsSubtle $IsSubtle1 -Italic $Italic1 -Strikethrough $Strikethrough1 -Underline $Underline1
    $textRun2 = Add-TextRun -Text $Text2 -Weight $Weight2 -Size $Size2 -Color $Color2 -SelectAction $SelectAction2 -Url $Url2 -FontType $FontType2 -Highlight $Highlight2 -IsSubtle $IsSubtle2 -Italic $Italic2 -Strikethrough $Strikethrough2 -Underline $Underline2
    $textRun3 = Add-TextRun -Text $Text3 -Weight $Weight3 -Size $Size3 -Color $Color3 -SelectAction $SelectAction3 -Url $Url3 -FontType $FontType3 -Highlight $Highlight3 -IsSubtle $IsSubtle3 -Italic $Italic3 -Strikethrough $Strikethrough3 -Underline $Underline3
    $textRun4 = Add-TextRun -Text $Text4 -Weight $Weight4 -Size $Size4 -Color $Color4 -SelectAction $SelectAction4 -Url $Url4 -FontType $FontType4 -Highlight $Highlight4 -IsSubtle $IsSubtle4 -Italic $Italic4 -Strikethrough $Strikethrough4 -Underline $Underline4
    $textRun5 = Add-TextRun -Text $Text5 -Weight $Weight5 -Size $Size5 -Color $Color5 -SelectAction $SelectAction5 -Url $Url5 -FontType $FontType5 -Highlight $Highlight5 -IsSubtle $IsSubtle5 -Italic $Italic5 -Strikethrough $Strikethrough5 -Underline $Underline5
    $textRun6 = Add-TextRun -Text $Text6 -Weight $Weight6 -Size $Size6 -Color $Color6 -SelectAction $SelectAction6 -Url $Url6 -FontType $FontType6 -Highlight $Highlight6 -IsSubtle $IsSubtle6 -Italic $Italic6 -Strikethrough $Strikethrough6 -Underline $Underline6
    $textRun7 = Add-TextRun -Text $Text7 -Weight $Weight7 -Size $Size7 -Color $Color7 -SelectAction $SelectAction7 -Url $Url7 -FontType $FontType7 -Highlight $Highlight7 -IsSubtle $IsSubtle7 -Italic $Italic7 -Strikethrough $Strikethrough7 -Underline $Underline7
    $textRun8 = Add-TextRun -Text $Text8 -Weight $Weight8 -Size $Size8 -Color $Color8 -SelectAction $SelectAction8 -Url $Url8 -FontType $FontType8 -Highlight $Highlight8 -IsSubtle $IsSubtle8 -Italic $Italic8 -Strikethrough $Strikethrough8 -Underline $Underline8
    $textRun9 = Add-TextRun -Text $Text9 -Weight $Weight9 -Size $Size9 -Color $Color9 -SelectAction $SelectAction9 -Url $Url9 -FontType $FontType9 -Highlight $Highlight9 -IsSubtle $IsSubtle9 -Italic $Italic9 -Strikethrough $Strikethrough9 -Underline $Underline9

    if ($textRun1) { $inlines += $textRun1 }
    if ($textRun2) { $inlines += $textRun2 }
    if ($textRun3) { $inlines += $textRun3 }
    if ($textRun4) { $inlines += $textRun4 }
    if ($textRun5) { $inlines += $textRun5 }
    if ($textRun6) { $inlines += $textRun6 }
    if ($textRun7) { $inlines += $textRun7 }
    if ($textRun8) { $inlines += $textRun8 }
    if ($textRun9) { $inlines += $textRun9 }

    if ($inlines.Count -gt 0) {
        $AdaptiveCard.attachments[0].content.body += @{
            type    = "RichTextBlock"
            inlines = $inlines
        }

        if (![string]::IsNullOrEmpty($Spacing)) {
            $AdaptiveCard.attachments[0].content.body[-1].spacing = $Spacing
        }

        if (![string]::IsNullOrEmpty($HAlign)) {
            $AdaptiveCard.attachments[0].content.body[-1].horizontalAlignment = $HAlign
        }
    }
}
