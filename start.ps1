Write-Host Bundle ASP.NET Core Project into EXE

Set-Location ElectronNET.WebApp
dotnet restore
dotnet publish -r win-x64 --output ../ElectronNET.Host/bin/

Write-Host Start Electron with bundled EXE
Set-Location ..\ElectronNET.Host
..\ElectronNET.Host\node_modules\.bin\electron.cmd "..\ElectronNET.Host\main.js"