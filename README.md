# CertToHyperVReplica
This script is designed to install a PFX certificate into the system to ensure authentication and encryption for virtual machine replication.

After loading the certificate from the PFX file, the script installs it into the computer's personal certificates. Then, the certificate is configured as the certificate for authentication and encryption of virtual machine replication.

To use the script, you need to specify the path to the PFX certificate file and the password to access it. If no password is provided, the certificate will be installed without it. Additionally, the script allows specifying the computer name where the certificate should be installed. If no computer name is specified, the current computer name will be used.

This script automates the certificate installation process, making it more efficient and convenient for virtualization system administrators.

Example usage of the script:

.\CertToHyperVReplica.ps1 -CertPath "YourPath\YurCert.pfx" -HostName "YourHostname" -Password "YourPassword"
