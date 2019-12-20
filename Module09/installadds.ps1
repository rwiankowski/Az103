$Password = Read-Host -Prompt 'Enter SafeMode Password' -AsSecureString

Install-WindowsFeature -Name AD-Domain-Services

$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'WinThreshold'
    DomainName = 'az103.local'
    DomainNetbiosName = 'az103local'
    ForestMode = 'WinThreshold'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $true
    SafeModeAdministratorPassword = $Password
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}
 
Install-ADDSForest @Params
