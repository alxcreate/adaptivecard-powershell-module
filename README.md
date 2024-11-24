# AdaptiveCard PowerShell Module

## Overview

AdaptiveCard is a PowerShell module that enables creation and sending of Adaptive Cards - a card-based UI framework that works across multiple platforms including Microsoft Teams.

Module using Adaptive Cards schema version 1.5. Be sure what your target platform supports any [features you are using](https://github.com/Microsoft/AdaptiveCards/?tab=readme-ov-file#supported-features).

## Installation

The module is available through the [PowerShell Gallery](https://powershellgallery.com/packages/AdaptiveCard/).

```powershell
# Install the module
Install-Module -Name AdaptiveCard

# Update to the latest version
Update-Module -Name AdaptiveCard

# Remove the module if needed
Uninstall-Module -Name AdaptiveCard
```

## Usage

### Creating an Adaptive Card

Start by creating a new Adaptive Card object:

```powershell
$AdaptiveCard = New-AdaptiveCard
```

### Adding Text Block

```powershell
Add-AdaptiveCardTextBlock -AdaptiveCard $AdaptiveCard -Text "Hello World!"
```

![Example Add-AdaptiveCardTextBlock](img/img01.png)

#### Customized Text Block

```powershell
Add-AdaptiveCardTextBlock -AdaptiveCard $AdaptiveCard `
    -Text "Hello World!" `
    -Weight "bolder" `
    -Size "large" `
    -Color "accent" `
    -Spacing "small"
```

![Example Add-AdaptiveCardTextBlock with styling](img/img02.png)

#### Text Block Parameters

| Parameter       | Description            | Default   | Available Values                                                       | Required |
| --------------- | ---------------------- | --------- | ---------------------------------------------------------------------- | -------- |
| `-AdaptiveCard` | Adaptive Card object   | -         | AdaptiveCard object                                                    | Yes      |
| `-Weight`       | Text weight            | `default` | `default`, `lighter`, `bolder`                                         |          |
| `-Size`         | Text size              | `default` | `default`, `small`, `medium`, `large`, `extraLarge`                    |          |
| `-Color`        | Text color             | `default` | `default`, `dark`, `light`, `accent`, `good`, `warning`, `attention`   |          |
| `-Spacing`      | Space before the block | `default` | `default`, `none`, `small`, `medium`, `large`, `extraLarge`, `padding` |          |

### Adding Rich Text Block

Rich text blocks allow combining multiple text elements with different styles. Maximum of 5 text elements can be combined:

```powershell
Add-AdaptiveCardRichTextBlock -AdaptiveCard $AdaptiveCard `
    -Text1 "Text one" `
    -Text2 "`nText two" `
    -Text3 "Text three" `
    -Text4 " Text four" `
    -Text5 "`nText five"
```

![Example Add-AdaptiveCardRichTextBlock](img/img03.png)

#### Customized Rich Text Block

```powershell
Add-AdaptiveCardRichTextBlock -AdaptiveCard $AdaptiveCard -Spacing "default" `
    -Text1 "Bolder large attention. " -Weight1 "bolder" -Size1 "large" -Color1 "accent" `
    -Text2 "Lighter medium accent." -Weight2 "lighter" -Size2 "medium" -Color2 "attention"

Add-AdaptiveCardRichTextBlock -AdaptiveCard $AdaptiveCard -Spacing "None" `
    -Text1 "No Spacing Bolder extraLarge warning. " -Weight1 "bolder" -Size1 "large" -Color1 "warning" `
    -Text2 "Default small good." -Weight2 "default" -Size2 "small" -Color2 "good"

Add-AdaptiveCardRichTextBlock -AdaptiveCard $AdaptiveCard -Spacing "padding" `
    -Text1 "Padding bolder large light. " -Weight1 "bolder" -Size1 "large" -Color1 "light" `
    -Text2 "Lighter extraLarge dark" -Weight2 "lighter" -Size2 "extraLarge" -Color2 "dark" `
    -Text3 "Bolder medium default" -Weight3 "bolder" -Size3 "medium" -Color3 "default" `
    -Text4 "Lighter small accent" -Weight4 "lighter" -Size4 "small" -Color4 "accent" `
    -Text5 "Bolder large good" -Weight5 "bolder" -Size5 "large" -Color5 "good"
```

Light theme result:
![Example Add-AdaptiveCardRichTextBlock Light theme](img/img04.png)

Dark theme result:
![Example Add-AdaptiveCardRichTextBlock Dark theme](img/img05.png)

#### Rich Text Block Parameters

Each text segment (Text1 through Text5) can have its own style parameters:

| Parameter       | Description                | Default   | Available Values                                                       | Required |
| --------------- | -------------------------- | --------- | ---------------------------------------------------------------------- | -------- |
| `-AdaptiveCard` | Adaptive Card object       | -         | AdaptiveCard object                                                    | Yes      |
| `-TextN`        | Text content for segment N | -         | Any string                                                             | Yes      |
| `-WeightN`      | Text weight for segment N  | `default` | `default`, `lighter`, `bolder`                                         | No       |
| `-SizeN`        | Text size for segment N    | `default` | `default`, `small`, `medium`, `large`, `extraLarge`                    | No       |
| `-ColorN`       | Text color for segment N   | `default` | `default`, `dark`, `light`, `accent`, `good`, `warning`, `attention`   | No       |
| `-Spacing`      | Space before the block     | `default` | `default`, `none`, `small`, `medium`, `large`, `extraLarge`, `padding` | No       |

### Adding Images

```powershell
Add-AdaptiveCardImage -AdaptiveCard $AdaptiveCard -Url "https://via.placeholder.com/150" -AltText "Placeholder image"
```

![Example Add-AdaptiveCardImage](img/img06.png)

#### Customized Image

```powershell
Add-AdaptiveCardImage -AdaptiveCard $AdaptiveCard `
    -Url "https://via.placeholder.com/150" `
    -AltText "Placeholder image" `
    -Size "medium" `
    -HAlign "center" `
    -Style "person" `
```

![Example Add-AdaptiveCardImage with styling](img/img07.png)

#### Image Parameters

| Parameter       | Description            | Default   | Available Values                                                       | Required |
| --------------- | ---------------------- | --------- | ---------------------------------------------------------------------- | -------- |
| `-AdaptiveCard` | Adaptive Card object   | -         | AdaptiveCard object                                                    | Yes      |
| `-Url`          | Image URL              | -         | Any valid URL                                                          | Yes      |
| `-AltText`      | Alt text for the image | -         | Any string                                                             | No       |
| `-Size`         | Image size             | `auto`    | `auto`, `stretch`, `small`, `medium`, `large`                          | No       |
| `-Width`        | Image width px         | -         | Number of pixels                                                       | No       |
| `-Height`       | Image height           | -         | Number of pixels                                                       | No       |
| `-HAlign`       | Horizontal alignment   | `left`    | `left`, `center`, `right`                                              | No       |
| `-Style`        | Image style            | `default` | `default`, `person`                                                    | No       |
| `-Spacing`      | Space before the block | `default` | `default`, `none`, `small`, `medium`, `large`, `extraLarge`, `padding` | No       |

Size examples:

- small
- medium
- large
- stretch

![Example Add-AdaptiveCardImage sizes](img/img08.png)

### Adding Media

```powershell
Add-AdaptiveCardMedia -AdaptiveCard $AdaptiveCard -Url "https://www.youtube.com/watch?v=jNQXAC9IVRw" -AltText "Me at the zoo"
```

![Example Add-AdaptiveCardMedia](img/img09.png)

#### Customized Media

Displays a media player for audio or video content.

```powershell
Add-AdaptiveCardMedia -AdaptiveCard $AdaptiveCard `
    -Url "https://www.youtube.com/watch?v=jNQXAC9IVRw" `
    -AltText "Me at the zoo" `
    -Poster "https://img.youtube.com/vi/jNQXAC9IVRw/default.jpg" `
    -Height "Stretch"
```

![Example Add-AdaptiveCardMedia with styling](img/img10.png)

#### Media Parameters

| Parameter       | Description            | Default     | Available Values                                                       | Required |
| --------------- | ---------------------- | ----------- | ---------------------------------------------------------------------- | -------- |
| `-AdaptiveCard` | Adaptive Card object   | -           | AdaptiveCard object                                                    | Yes      |
| `-Url`          | Media URL              | -           | Any valid URL                                                          | Yes      |
| `-Poster`       | Poster image URL       | -           | Any valid URL                                                          | No       |
| `-AltText`      | Alt text for the media | -           | Any string                                                             | No       |
| `-Height`       | Media height           | `automatic` | `automatic`, `stretch`                                                 | No       |
| `-Spacing`      | Space before the block | `default`   | `default`, `none`, `small`, `medium`, `large`, `extraLarge`, `padding` | No       |

### Sending to Microsoft Teams

To send the card to Microsoft Teams, you'll need a webhook URL:

```powershell
# Example url for send adaptive card to Microsoft Teams
$WorkflowUrl = "https://prod-11.westeurope.logic.azure.com:443/workflows/..."

Send-AdaptiveCardToTeams -AdaptiveCard $AdaptiveCard -Workflow $WorkflowUrl
```

## Theme Support

The module supports both light and dark themes in Microsoft Teams. Colors will automatically adjust based on the user's theme settings, as shown in the examples above.
