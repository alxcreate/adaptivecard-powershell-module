
# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.2.0] - 2024-11-27

### Added

- Information for Get-Help.
- Examples.
- Validate parameters for all functions.
- Parameters for `Add-AdaptiveCardRichTextBlock`:
  - `SelectAction`
  - `Url`
  - `FontType`
  - `Highlight`
  - `IsSubtle`
  - `Italic`
  - `Strikethrough`
  - `Underline`
- Parameters for `Add-AdaptiveCardTextBlock`:
  - `FontType`
  - `HAlign`
  - `IsSubtle`
  - `MaxLines`
  - `Wrap`

## [1.1.0] - 2024-11-24

### Added

- Added functions:
  - `Add-AdaptiveCardImage`
  - `Add-AdaptiveCardMedia`

### Changed

- Changed Adaptive Card version from 1.4 to 1.5.

## [1.0.1] - 2024-11-22

No code changes.

### Fixed

- Changed description on [powershellgallery.com](https://www.powershellgallery.com/packages/AdaptiveCard).

## [1.0.0] - 2024-11-22

### Added

- Initial release.
- Added functions:
  - `New-AdaptiveCard`
  - `Add-AdaptiveCardTextBlock`
  - `Add-AdaptiveCardRichTextBlock`
  - `Set-AdaptiveCardToTeams`
