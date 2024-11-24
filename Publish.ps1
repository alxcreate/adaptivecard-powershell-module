$apiKey = "YOUR_NUGET_API_KEY"
Test-ModuleManifest -Path ".\AdaptiveCard\AdaptiveCard.psd1"
Publish-Module -Path ".\AdaptiveCard" -NuGetApiKey $apiKey -Verbose
