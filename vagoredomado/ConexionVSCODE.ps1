# Ruta predeterminada para la clave SSH
$KeyPath = "$HOME\.ssh\id_rsa"

# Verificar si el archivo de clave SSH ya existe
if (Test-Path -Path $KeyPath) {
    # El archivo ya existe, preguntar al usuario si quiere sobrescribirlo
    $overwrite = Read-Host "El archivo de clave SSH ya existe en la ruta: $KeyPath. �Desea sobrescribirlo? (S�/No)"

    # Convertir la respuesta a min�sculas para comparar
    $overwrite = $overwrite.ToLower()

    if ($overwrite -ne "si" -and $overwrite -ne "s�") {
        # Si la respuesta no es "s�", salir del script
        Write-Host "No se ha generado una nueva clave SSH."
        exit
    }
}

# Solicitar el correo electr�nico al usuario
$Email = Read-Host "Por favor, introduce tu correo electr�nico (comentario para la clave SSH)"

# Asegurarse de que el directorio .ssh exista
$sshDir = [System.IO.Path]::GetDirectoryName($KeyPath)
if (-not (Test-Path -Path $sshDir)) {
    New-Item -ItemType Directory -Path $sshDir -Force
}

# Comando para generar la clave SSH
$command = "ssh-keygen -t rsa -b 4096 -C `"$Email`" -f `"$KeyPath`""

# Ejecutar el comando
Write-Host "Generando clave SSH en: $KeyPath con el comentario: $Email"
if ($PSVersionTable.PSVersion.Major -ge 6) {
    bash -c $command
} else {
    cmd.exe /c $command
}

Write-Host "Clave SSH generada exitosamente."

# A�adir configuraci�n al archivo de configuraci�n SSH
$vmName = Read-Host "Introduce el nombre de la m�quina virtual"
$vmIP = Read-Host "Introduce la direcci�n IP de la VM"
$vmUser = Read-Host "Introduce tu usuario en la VM"
$ConfigPath = "$HOME\.ssh\config"

# Asegurarse de que el directorio .ssh exista
$sshDir = [System.IO.Path]::GetDirectoryName($ConfigPath)
if (-not (Test-Path -Path $sshDir)) {
    New-Item -ItemType Directory -Path $sshDir -Force
}

# Crear la entrada de configuraci�n
$ConfigEntry = @"
Host $vmName
  HostName $vmIP
  User $vmUser
"@

# A�adir la entrada al archivo de configuraci�n
if (Test-Path -Path $ConfigPath) {
    Add-Content -Path $ConfigPath -Value $ConfigEntry
} else {
    $ConfigEntry | Out-File -FilePath $ConfigPath
}

Write-Host "Configuraci�n de SSH actualizada en $ConfigPath"
