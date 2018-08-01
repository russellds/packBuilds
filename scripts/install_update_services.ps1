Configuration InstallUpdateServices
{
     #Import-DscResource -ModuleName UpdateServicesDsc
     Node 'localhost'
     {
         WindowsFeature UpdateServices
         {
             Ensure = 'Present'
             Name = 'UpdateServices'
         }
         WindowsFeature UpdateServices-Ui
         {
             Ensure = 'Present'
             Name = 'UpdateServices-Ui'
         }
         <#
         UpdateServicesServer UpdateServices
         {
             Ensure = 'Present'
             ContentDir = 'C:\wsus'
             Languages = 'en'
             Products = 'Microsoft SQL Server 2012', 
                'Microsoft SQL Server 2014',
                'Windows Server 2012 R2',
                'System Center 2012 R2 - Operations Manager',
                'System Center 2012 R2 - Virtual Machine Manager'
             Classifications = 'Update Rollups',
                'Security Updates',
                'Critical Updates',
                'Service Packs',
                'Definition Updates',
                'Updates'
             Synchronize = $true
         }
         #>
     }
 }
 InstallUpdateServices -OutputPath 'C:\Temp\InstallUpdateServices'
 Start-DscConfiguration -Path 'C:\Temp\InstallUpdateServices' -Wait -Verbose
