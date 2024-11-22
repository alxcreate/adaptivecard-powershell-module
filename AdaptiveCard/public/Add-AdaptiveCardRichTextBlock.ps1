function Add-AdaptiveCardRichTextBlock {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [string]$Spacing = "default",
        [Parameter(Mandatory)]
        [string]$Text1,
        [string]$Weight1 = "default",
        [string]$Size1 = "default",
        [string]$Color1 = "default",
        [string]$Text2 = "",
        [string]$Weight2 = "default",
        [string]$Size2 = "default",
        [string]$Color2 = "default",
        [string]$Text3 = "",
        [string]$Weight3 = "default",
        [string]$Size3 = "default",
        [string]$Color3 = "default",
        [string]$Text4 = "",
        [string]$Weight4 = "default",
        [string]$Size4 = "default",
        [string]$Color4 = "default",
        [string]$Text5 = "",
        [string]$Weight5 = "default",
        [string]$Size5 = "default",
        [string]$Color5 = "default"
    )

    $inlines = @()

    function Add-TextRun {
        param($Text, $Weight, $Size, $Color)
        if (![string]::IsNullOrEmpty($Text)) {
            return @{
                type   = "TextRun"
                text   = $Text
                weight = $Weight
                size   = $Size
                color  = $Color
            }
        }
    }

    $textRun1 = Add-TextRun -Text $Text1 -Weight $Weight1 -Size $Size1 -Color $Color1
    if ($textRun1) { $inlines += $textRun1 }

    $textRun2 = Add-TextRun -Text $Text2 -Weight $Weight2 -Size $Size2 -Color $Color2
    if ($textRun2) { $inlines += $textRun2 }

    $textRun3 = Add-TextRun -Text $Text3 -Weight $Weight3 -Size $Size3 -Color $Color3
    if ($textRun3) { $inlines += $textRun3 }

    $textRun4 = Add-TextRun -Text $Text4 -Weight $Weight4 -Size $Size4 -Color $Color4
    if ($textRun4) { $inlines += $textRun4 }

    $textRun5 = Add-TextRun -Text $Text5 -Weight $Weight5 -Size $Size5 -Color $Color5
    if ($textRun5) { $inlines += $textRun5 }

    if ($inlines.Count -gt 0) {
        $AdaptiveCard.attachments[0].content.body += @{
            type    = "RichTextBlock"
            spacing = $Spacing
            inlines = $inlines
        }
    }
}
