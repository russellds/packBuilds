#Install Nuget Package Provider
Install-PackageProvider -Name NuGet -Force

#Install Powershell Modules
Install-Module -Name PSWindowsUpdate -RequiredVersion 1.5.2.2 -Force
Install-Module -Name xRemoteDesktopAdmin -RequiredVersion 1.1.0.0 -Force
Install-Module xCertificate -RequiredVersion 2.3.0.0 -Force
