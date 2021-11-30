echo "Start building Electron.NET dev stack..."

echo "Restore & Build API"
cd ElectronNet.API
dotnet restore
dotnet build
cd ..
echo "Restore & Build CLI"
cd ElectronNet.CLI
dotnet restore
dotnet build
cd ..
echo "Restore & Build WebApp Demo"
cd ElectronNet.WebApp
dotnet restore
dotnet build

echo "Invoke electronize build in WebApp Demo"

echo "Install CLI"

dotnet tool uninstall ElectronNET.CLI -g
dotnet tool install ElectronNET.CLI -g

echo "/target xxx (dev-build)"
..\ElectronNET.CLI\bin\Debug\net6.0\publish\dotnet-electronize-h5.exe build /target custom win7-x86;win /dotnet-configuration Debug /electron-arch ia32  /electron-params "--publish never"

echo "/target win (dev-build)"
..\ElectronNET.CLI\bin\Debug\net6.0\publish\dotnet-electronize-h5.exe build /target win /electron-params "--publish never"

echo "/target custom win7-x86;win (dev-build)"

..\ElectronNET.CLI\bin\Debug\net6.0\publish\dotnet-electronize-h5.exe build /target custom win7-x86;win /electron-params "--publish never"