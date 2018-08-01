Configuration InstallPackageManagement
{
     Node 'localhost'
     {
         Package InstallPackageManagement
         {
             Ensure = 'Present'
             Name = 'Package Management Preview - x64'
             Path = 'C:\tmp\PackageManagement_x64.msi'
             ProductId = '57E5A8BB-41EB-4F09-B332-B535C5954A28'
         }
     }
 }
 InstallPackageManagement -OutputPath 'C:\tmp\PackageManagement'
 Start-DscConfiguration -Path C:\tmp\PackageManagement -Wait
