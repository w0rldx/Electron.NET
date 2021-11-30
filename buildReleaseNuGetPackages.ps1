$ENETVER = "13.5.1"

Write-Host "Start building Electron.NET dev stack..."
Write-Host "Restore & Build API"
Set-Location ElectronNet.API
dotnet restore
dotnet build --configuration Release --force /property:Version=$ENETVER
dotnet pack /p:Version=$ENETVER --configuration Release --force --output "%~dp0artifacts"
Set-Location ..
Write-Host "Restore & Build CLI"
Set-Location ElectronNet.CLI
dotnet restore
dotnet build --configuration Release --force /property:Version=$ENETVER
dotnet pack /p:Version=$ENETVER --configuration Release --force --output "%~dp0artifacts"
Set-Location ..