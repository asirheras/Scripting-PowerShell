#script: LEC2.ps1
#fecha: 20250528
#Autor: AsirHeras

<#Descripción: El script manda un archivo desde l máquina local a 
la máquina remota (EC2)
#>
$keyPath    = "$HOME\.ssh\llaveAWS.pem"
$remoteUser = "ubuntu"
$remoteHost = "ec2-34-227-60-134.compute-1.amazonaws.com"
$remoteTmp  = "/home/$remoteUser"
$localDir   = "C:\Scripts"
$fileName   = "files.rar"

# Copia local a remoto
scp -i $keyPath "$localDir\\$fileName" "$remoteUser@$remoteHost:$remoteTmp/"