<#
 Script:11.ps1
 Fecha: 21/02/2024
 Descripcion:Escribir un script que reciba como parámetros el nombre de dos archivos y visualice
             por pantalla cuál es más moderno.
#>
param (
    [string]$archivo1,
    [string]$archivo2
)

# Verificar si se proporcionaron exactamente dos archivos como argumentos
if ($args.Count -eq 2) {
    Write-Host "Debes proporcionar dos nombres de archivos como argumentos."
    exit
}

# Obtener la información de la fecha de creación de los archivos
$fechaCreacionArchivo1 = (Get-Item $archivo1).CreationTime
$fechaCreacionArchivo2 = (Get-Item $archivo2).CreationTime

# Comparar las fechas de creación para determinar cuál archivo es más moderno
if ($fechaCreacionArchivo1 -gt $fechaCreacionArchivo2) {
    Write-Host "El archivo '$archivo1' es más moderno que el archivo '$archivo2'."
} elseif ($fechaCreacionArchivo1 -lt $fechaCreacionArchivo2) {
    Write-Host "El archivo '$archivo2' es más moderno que el archivo '$archivo1'."
} else {
    Write-Host "Los archivos '$archivo1' y '$archivo2' tienen la misma fecha de creación."
}