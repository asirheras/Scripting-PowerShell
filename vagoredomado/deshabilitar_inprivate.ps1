# Define la clave del Registro donde se guarda la configuración de InPrivate en Edge
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"

# Define el nombre del valor de la configuración
$ValueName = "InPrivateModeAvailability"

# Crea la clave de Edge si no existe
if (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Configura el valor para deshabilitar el modo InPrivate (1 = Deshabilitar, 0 = Habilitar)
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value 1

Write-Output "El modo InPrivate ha sido deshabilitado en Microsoft Edge."