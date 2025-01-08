<#
.SYNOPSIS
    Adds a fact set element to an Adaptive Card object.

.DESCRIPTION
    The Add-AdaptiveCardFactSet function adds a collection of fact pairs (title-value) to an existing Adaptive Card object.
    It supports up to 9 fact-value pairs and includes formatting options such as height, separator, and spacing.
    The function is designed for creating structured key-value presentations within Adaptive Cards.

.PARAMETER AdaptiveCard
    Required. The Adaptive Card object to which the fact set will be added.
    This should be an existing card object with a valid structure containing attachments[0].content.body.

.PARAMETER Height
    Optional. Specifies the height behavior of the fact set.
    Valid values: "auto", "stretch"
    Default: None

.PARAMETER Separator
    Optional. When set to true, displays a separator line above the fact set.
    Default: False

.PARAMETER Spacing
    Optional. The spacing around the fact set element.
    Valid values: "default", "none", "small", "medium", "large", "extraLarge", "padding"
    Default: "default"

.PARAMETER FactN
    Required. The title of the fact in the set (where N is 1-9).

.PARAMETER ValueN
    Required. The value corresponding to FactN (where N is 1-9).

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardFactSet -AdaptiveCard $AdaptiveCard `
                           -Fact1 "Employee" -Value1 "John Doe" `
                           -Fact2 "Department" -Value2 "IT" `
                           -Fact3 "Position" -Value3 "Developer"

    Adds a fact set with three key-value pairs using default formatting.

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardFactSet -AdaptiveCard $AdaptiveCard `
                           -Height "stretch" `
                           -Separator $true `
                           -Spacing "large" `
                           -Fact1 "Project" -Value1 "Mobile App" `
                           -Fact2 "Status" -Value2 "In Progress"

    Adds a fact set with custom formatting including stretched height, separator, and large spacing.

.EXAMPLE
    $AdaptiveCard = New-AdaptiveCard
    Add-AdaptiveCardFactSet -AdaptiveCard $AdaptiveCard `
                           -Fact1 "Temperature" -Value1 "72°F" `
                           -Fact2 "Humidity" -Value2 "45%" `
                           -Fact3 "Wind" -Value3 "10 mph" `
                           -Spacing "medium"

    Adds a weather-related fact set with medium spacing.

.NOTES
    - The function requires at least one fact-value pair (Fact1 and Value1).
    - Additional fact-value pairs are optional and will only be added if both title and value are provided.
    - The function automatically handles null or empty fact-value pairs by excluding them from the output.
    - Consider using appropriate spacing and separators when combining multiple fact sets in a single card.
    - The height parameter can be useful for controlling the layout when used within containers.
#>

function Add-AdaptiveCardFactSet {
    param (
        [Parameter(Mandatory)]
        [object]$AdaptiveCard,
        [ValidateSet('auto', 'stretch')]
        [string]$Height,
        [bool]$Separator,
        [ValidateSet('default', 'none', 'small', 'medium', 'large', 'extraLarge', 'padding')]
        [string]$Spacing,

        [Parameter(Mandatory)]
        [string]$Fact1,
        [Parameter(Mandatory)]
        [string]$Value1,

        [string]$Fact2,
        [string]$Value2,

        [string]$Fact3,
        [string]$Value3,

        [string]$Fact4,
        [string]$Value4,

        [string]$Fact5,
        [string]$Value5,

        [string]$Fact6,
        [string]$Value6,

        [string]$Fact7,
        [string]$Value7,

        [string]$Fact8,
        [string]$Value8,

        [string]$Fact9,
        [string]$Value9
    )

    $facts = [System.Collections.ArrayList]@()

    for ($i = 1; $i -le 9; $i++) {
        $fact = Get-Variable -Name "Fact$i" -ValueOnly
        $value = Get-Variable -Name "Value$i" -ValueOnly

        if (![string]::IsNullOrEmpty($fact)) {
            $null = $facts.Add(@{
                title = $fact
                value = $value
            })
        }
    }

    if ($facts.Count -gt 0) {
        $AdaptiveCard.attachments[0].content.body += @{
            type    = "FactSet"
            facts   = $facts
        }

        if (![string]::IsNullOrEmpty($Height)) {
            $AdaptiveCard.attachments[0].content.body[-1].height = $Height
        }

        if (![string]::IsNullOrEmpty($Separator)) {
            $AdaptiveCard.attachments[0].content.body[-1].separator = $Separator
        }

        if (![string]::IsNullOrEmpty($Spacing)) {
            $AdaptiveCard.attachments[0].content.body[-1].spacing = $Spacing
        }
    }
}
