function Add-AdaptiveCardTextBlock {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [Parameter(Mandatory)]
        [string]$Text,
        [string]$Weight = "default", # default, lighter, bolder
        [string]$Size = "default", # default, small, medium, large, extraLarge
        [string]$Color = "default", # default, dark, light, accent, good, warning, attention
        [string]$Spacing = "default" # default, none, small, medium, large, extraLarge, padding
    )
    $AdaptiveCard.attachments[0].content.body += @{
        type    = "TextBlock"
        text    = "$($Text)"
        weight  = "$($Weight)"
        size    = "$($Size)"
        color   = "$($Color)"
        spacing = "$($Spacing)"
        wrap    = $Wrap
    }
}
