<#Escribir un script que recibe como parámetro la extensión de un archivo.
Posteriormente crea un directorio temporal para el usuario que ejecuta el script en el
directorio C:\temp con el mismo nombre del usuario y copia allí todos los archivos
con dicha extensión.#>

# Limpiamos pantalla
Clear-Host

# Introducimos un parametro de tipo cadena llamado extension
param (
    [string]$extension
)

# Limpiamos pantalla
Clear-Host

# Verificar si se proporcionó una extensión
if (-not $extension) {
    Write-Host "Debes proporcionar una extensión de archivo."
    exit
}

# Crear un directorio temporal en C:\temp con el nombre de usuario

$directorio = "C:\temp\$env:USERNAME"

# Confirmamos la existencia del directorio

if (test-path -path $directorio) {
    Write-Host "El directorio existe"
}else{
    New-Item -ItemType Directory -Path $directorio -Force
}

Copy-Item -Path "$env:USERPROFILE\*.$extension" -Destination $directorio -Recurse


Write-Host "Se han copiado los archivos con la extensión .$extension al directorio temporal: $directorio"