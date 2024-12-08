# Ruta predeterminada para la clave SSH
$KeyPath = "$HOME\.ssh\id_rsa"

# Verificar si el archivo de clave SSH ya existe
if (Test-Path -Path $KeyPath) {
    # El archivo ya existe, preguntar al usuario si quiere sobrescribirlo
    $overwrite = Read-Host "El archivo de clave SSH ya existe en la ruta: $KeyPath. ¿Desea sobrescribirlo? (Sí/No)"

    # Convertir la respuesta a minúsculas para comparar
    $overwrite = $overwrite.ToLower()

    if ($overwrite -ne "si" -and $overwrite -ne "sí") {
        # Si la respuesta no es "sí", salir del script
        Write-Host "No se ha generado una nueva clave SSH."
        exit
    }
}

# Solicitar el correo electrónico al usuario
$Email = Read-Host "Por favor, introduce tu correo electrónico (comentario para la clave SSH)"

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

# Añadir configuración al archivo de configuración SSH
$vmName = Read-Host "Introduce el nombre de la máquina virtual"
$vmIP = Read-Host "Introduce la dirección IP de la VM"
$vmUser = Read-Host "Introduce tu usuario en la VM"
$ConfigPath = "$HOME\.ssh\config"

# Asegurarse de que el directorio .ssh exista
$sshDir = [System.IO.Path]::GetDirectoryName($ConfigPath)
if (-not (Test-Path -Path $sshDir)) {
    New-Item -ItemType Directory -Path $sshDir -Force
}

# Crear la entrada de configuración
$ConfigEntry = @"
Host $vmName
  HostName $vmIP
  User $vmUser
"@

# Añadir la entrada al archivo de configuración
if (Test-Path -Path $ConfigPath) {
    Add-Content -Path $ConfigPath -Value $ConfigEntry
} else {
    $ConfigEntry | Out-File -FilePath $ConfigPath
}

Write-Host "Configuración de SSH actualizada en $ConfigPath"
