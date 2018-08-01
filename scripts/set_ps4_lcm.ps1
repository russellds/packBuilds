Configuration ConfigLCM
{
    Node 'localhost'
    {
        LocalConfigurationManager
        {
            RefreshMode = 'Push'
            ConfigurationMode = 'ApplyOnly'
            RebootNodeIfNeeded = $false
            AllowModuleOverwrite = $true
        }
    }
}
ConfigLCM -OutputPath "C:\Temp\ConfigLCM"
Set-DscLocalConfigurationManager -Path "C:\Temp\ConfigLCM"