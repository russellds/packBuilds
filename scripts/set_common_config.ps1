Configuration ConfigRemoteDesktop
{
    Import-DscResource -ModuleName xRemoteDesktopAdmin

    Node 'localhost'
    {
        xRemoteDesktopAdmin RemoteDesktopSettings
        {
            Ensure = 'Present'
            UserAuthentication = 'NonSecure'
        }
    }
}
ConfigRemoteDesktop -OutputPath 'C:\Temp\ConfigRemoteDesktop'
Start-DscConfiguration -Path C:\Temp\ConfigRemoteDesktop -Wait

Set-NetFirewallRule -Name 'RemoteDesktop-UserMode-In-TCP' -Enabled 'True' -Profile 'Any'
Set-NetFirewallRule -Name 'RemoteDesktop-UserMode-In-UDP' -Enabled 'True' -Profile 'Any'

