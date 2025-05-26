# Define la clave del Registro para las políticas de Firefox
$RegistryPath = "HKLM:\SOFTWARE\Policies\Mozilla\Firefox"

# Define el nombre y valor de la configuración para desactivar el modo privado
$ValueName = "DisablePrivateBrowsing"

# Crea la clave de Firefox si no existe
if (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Configura el valor para deshabilitar el modo privado (1 = Deshabilitar, 0 = Habilitar)
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value 1

Write-Output "El modo privado ha sido deshabilitado en Firefox."
