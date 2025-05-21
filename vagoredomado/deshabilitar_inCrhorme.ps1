# Define la clave del Registro donde se guarda la configuración de Incógnito en Chrome
$RegistryPath = "HKLM:\SOFTWARE\Policies\Google\Chrome"

# Define el nombre del valor de la configuración
$ValueName = "IncognitoModeAvailability"

# Crea la clave de Chrome si no existe
if (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Configura el valor para deshabilitar el modo incógnito (1 = Deshabilitar, 0 = Habilitar)
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value 1

Write-Output "El modo incógnito ha sido deshabilitado en Google Chrome."
