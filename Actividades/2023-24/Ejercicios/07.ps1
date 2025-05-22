<#
 Script: actividad07.ps1
 Fecha: 22/01/2024
 Descripción:Crear un script que reciba como parámetro el nombre de una carpeta y genere un
archivo empaquetado y comprimido de esa carpeta como copia de seguridad. Pista:
cmdlet Compress-Archive.
#>

param (
    [string]$carpeta
)

clear-host

# Verificar si se proporcino un parámetro
if (-not $carpeta) {
    Write-Host "Por favor, proporciona el nombre de la carpeta como parámetro."
    exit
}

# Verificar si la carpeta existe
if (-not (Test-Path $carpeta -PathType Container)) {
    Write-Host "La carpeta especificada no existe."
    exit
}

# Nombre del archivo comprimido
$nombreArchivo = "$carpeta-Backup.zip"

# Comprimir y empaquetar la carpeta
Compress-Archive -Path $carpeta -DestinationPath $nombreArchivo -Force

Write-Host "Copia de seguridad creada correctamente en: $nombreArchivo"