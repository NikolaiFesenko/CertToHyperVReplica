param(
    [Parameter()]
    [string]$HostName = "$Env:ComputerName.$Env:UserDNSDomain",

    [Parameter(Mandatory=$true)]
    [string]$CertPath,
    
    [Parameter()]
    [string]$Password = ''
)

#Receive a certificate thumbprint
$cert = Get-PfxCertificate -FilePath $CertPath
$thumbprint = $cert.Thumbprint

#Installing a certificate
if ($Password -eq '') {
    Import-PfxCertificate -FilePath $CertPath -CertStoreLocation Cert:\LocalMachine\My
    }
else {
    $SecurePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
    Import-PfxCertificate -FilePath $CertPath -CertStoreLocation Cert:\LocalMachine\My -Password $SecurePassword
    }

#Bind a certificate to replicated virtual machines
Get-VMReplication -PrimaryServerName $HostName | Set-VMReplication -CertificateThumbprint $CertThumbrint
