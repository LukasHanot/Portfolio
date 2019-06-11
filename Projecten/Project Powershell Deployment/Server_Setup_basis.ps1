# powershell >=2.0
# Author: Lukas Hanot
# Version: 13/05/2016
# Functie: Automatisch aanmaken site/sqldb/FTP
# Example: powershell ./sitedeployer teamnaam Password007 8020

#TODO:
<#
Server niet specifiek opdelen in "teams"
Firewall
Installeert/configureert/activeert alle roles/services
#>

Clear-Host

Set-Location -Path $PSScriptRoot\Config
Get-Content .\Server_Setup_Settings.txt | Foreach-Object{
   $var = $_.Split('=')
   New-Variable -Name $var[0] -Value $var[1]
   }

$usernaam = "superAdmin"
$userpass = $([System.Web.Security.Membership]::GeneratePassword(8,1))
$cu = [Environment]::UserName
$usernaam > "c:\Users\$cu\Desktop\UserInfo.txt"
$userpass >> "c:\Users\$cu\Desktop\UserInfo.txt"
$sitenaam =  "GemeenteParticipatiePlatform"
$sitePort= "8017"
$sqlInstallLocation =".\SQL_Setup\SQL Server 2012 Developer Edition\"
$sqlServerInstanceName="WINPROJ"
$sqlServerName=$sqlServerInstanceName
$databaseAdminUser="sa"
$databaseAdminPassword="TestWachtw00rd12!"
$Sitedir="C:\inetpub"
$Settingsdir="C:\inetprofiles"
$AppCmd="C:\Windows\System32\inetsrv\appcmd.exe"

#Install .NET
if(($WindowsVersion.Major -eq 6) -and ($WindowsVersion -lt 2)) {
    Add-WindowsFeature AS-Net-Framework;
}
ElseIf (($WindowsVersion.Major -eq 6) -and ($WindowsVersion -gt 2)) {
    Add-WindowsFeature NET-Framework-Core;
}

#Install IIS server
Add-WindowsFeature -Name Web-Server -IncludeAllSubFeature

# .NET toegang geven tot databank
Add-WindowsFeature Net-Framework-Core
$aspnet="C:\WINDOWS\Microsoft.NET\Framework64\v4.0.30319\aspnet_regsql.exe"

# Install WDeploy
Write-Host "Installeer WDeploy"
Set-Location -Path $PSScriptRoot/WebDeploy
$Installer="WebDeploy_amd64_en-US.msi"
$Webpath = "http://download.microsoft.com/download/D/4/4/D446D154-2232-49A1-9D64-F5A9429913A4/WebDeploy_amd64_en-US.msi"
#Invoke-WebRequest -Uri $Webpath -OutFile $Installer
msiexec /a $Installer /qb TARGETDIR=`"C:\Program Files\WebDeploy`"
$Scriptdir="C:\Program Files\WebDeploy\x64\IIS\Microsoft Web Deploy V3"
sleep -s 3

# Path tests
Set-Location -Path "$Scriptdir"
if (!(Test-Path -path $Sitedir)) {New-Item $Sitedir -Type Directory}
if (!(Test-Path -path $Settingsdir)) {New-Item $Settingsdir -Type Directory}
if (!(Test-Path ".\SetupSiteForPublish.ps1"))
{ Write-Host -NoNewline "Installeer Wdeploy.exe"; Exit 1 }

##################### User per team aanmaken
net user $usernaam $userpass /Y /add /passwordchg:no /expires:never /active:yes `
/fullname:$usernaam /comment:$usernaam
# Set the FTP user account’s password not to expire#>
$WMI = gwmi win32_useraccount | where {$_.name -eq $usernaam}
$WMI.PasswordExpires = $False
$WMI.put()

###################### Site publiceren in IIS . Elk team een eigen App Pool
Write-Host "publiceren site $sitenaam"
$siteName=$sitenaam
$sitePhysicalPath=$Sitedir+"\"+$siteName
$siteAppPoolName=$sitenaam+"AppPool"
$deploymentUserName=$teamnaam
$deploymentUserPassword=$teampass
$managedRunTimeVersion="v4.0"

.\SetupSiteForPublish.ps1 -siteName $siteName -sitePhysicalPath $sitePhysicalPath `
-siteAppPoolName $siteAppPoolName -sitePort $sitePort -deploymentUserName `
$deploymentUserName -deploymentUserPassword $deploymentUserPassword `
-publishSettingSavePath $Settingsdir -publishSettingFileName $siteName" .PublishSettings" `
-managedRunTimeVersion $managedRunTimeVersion

################### SQL Server installeren
Write-Host "SQL Server installeren"
Set-Location -Path $PSScriptRoot/SQL_Setup
.\SQL_InstallScript.ps1 -PackagePath $sqlInstallLocation -WinSources $aspnet

################### SQL db aanmaken
Write-Host "SQL db aanmaken voor $sitenaam"
$databaseName="db$sitenaam"
$databaseUserName="dbuser$sitenaam"
$databaseUserPassword=$userpass
Set-Location -Path "$Scriptdir"

.\CreateSqlDatabase.ps1 -databaseName $databaseName -databaseUserName $databaseUserName `
-databaseUserPassword $databaseUserPassword -databaseAdminUser $databaseAdminUser `
-databaseAdminPassword $databaseAdminPassword -sqlServerInstanceName $sqlServerInstanceName `
-publishSettingSavePath $Settingsdir -publishSettingFileName $databaseName".PublishSettings"

#################### Default pagina klaarzetten op de site
echo "<html><body><h2>Default pagina $sitenaam</h2><p><%Response.Write(now())" `
"%></p></body></html>" | Out-File $sitePhysicalPath\default.aspx
# Virtuele dir op default website
<#$appcmd ADD vdir /app.name:"Default Web Site/" /path:/$sitenaam /physicalPath:C:\ `
$Sitedir\$teamnaam#>

# .NET toegang geven tot databank
# -A toegang tot alle features -E login/pass van huidige user gebruiken
Write-Host ".NET toegang tot db"
& $aspnet -S $sqlServerName -d $databaseName -A all -E

# FTP toegang tot site , FTP site was manueel aangemaakt in IIS
if (!(Test-Path -path $sitePhysicalPath)) {New-Item $sitePhysicalPath -Type `
Directory}
& $AppCmd set config "FTP" -section:system.ftpServer/security/authorization /"[accessType='Allow',users='$usernaam',permissions='Read, Write']" /commit:apphost

######### open extra ports in firewall
Write-Host "Setting Windows Firewall rules for $sitenaam "
netsh advfirewall firewall add rule name="Projecten-$sitenaam-IN" dir=in `
action=allow protocol=TCP localport=$sitePort
netsh advfirewall firewall add rule name="Projecten-$sitenaam-OUT" dir=out `
action=allow protocol=TCP remoteport=$sitePort

######### Deploy webpagina
Set-Location -Path $PSScriptRoot/IntegratieProjectDeploy
./IntegratieProject.deploy.cmd /Y
