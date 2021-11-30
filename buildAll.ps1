Write-Host "Start building Electron.NET dev stack..."

Write-Host  "Restore & Build API"
Set-Location ElectronNet.API
dotnet restore
dotnet build
Set-Location ..
Write-Host  "Restore & Build CLI"
Set-Location ElectronNet.CLI
dotnet restore
dotnet build
Set-Location ..
Write-Host  "Restore & Build WebApp Demo"
Set-Location ElectronNet.WebApp
dotnet restore
dotnet build

Write-Host  "Invoke electronize build in WebApp Demo"

if (Test-Path -Path ".\obj") {
    Remove-Item '.\obj' -Recurse
}

Write-Host "/target win (dev-build)"
..\ElectronNET.CLI\bin\Debug\net6.0\publish\dotnet-electronize-h5.exe build /target win /electron-params "--publish never"

Set-Location ..