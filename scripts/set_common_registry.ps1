Configuration SetCommonRegistry
{
    Node 'localhost'
    {
        Registry DisableNetworkDiscovery
        {
            Ensure = 'Present'
            Key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff'
            ValueName = ''
        }
        Registry ShowFileExtensionsInExplorer
        {
            Ensure = 'Present'
            Key = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
            ValueName = 'HideFileExt'
            ValueData = '0'
            ValueType = 'Dword'
        }
        Registry EnableQuickEditMode
        {
            Ensure = 'Present'
            Key = 'HKCU:\Console'
            ValueName = 'QuickEdit'
            ValueData = '1'
            ValueType = 'Dword'
        }
        Registry ShowRunCommandOnStartMenu
        {
            Ensure = 'Present'
            Key = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
            ValueName = 'Start_ShowRun'
            ValueData = '1'
            ValueType = 'Dword'
        }
        Registry ShowAdministrativeToolsOnStartMenu
        {
            Ensure = 'Present'
            Key = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
            ValueName = 'StartMenuAdminTools'
            ValueData = '1'
            ValueType = 'Dword'
        }
        Registry DisableUAC
        {
            Ensure = 'Present'
            Key = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system'
            ValueName = 'EnableLUA'
            ValueData = '0'
            ValueType = 'Dword'
        }
    }
}
SetCommonRegistry -OutputPath 'C:\Temp\SetCommonRegistry'
Start-DscConfiguration -Path C:\Temp\SetCommonRegistry -Wait
