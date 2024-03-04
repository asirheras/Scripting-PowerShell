<#
Script:Variables de entorno
Autor:Andr�s Heras
Fecha:2023016
Descripci�n:Escribir un script que recibe como par�metro la extensi�n de un archivo.
Posteriormente crea un directorio temporal para el usuario que ejecuta el script en el
directorio C:\temp con el mismo nombre del usuario y copia all� todos los archivos
con dicha extensi�n.
#>

param (
    [string]$extension
)
Clear-Host
#verificar si se proporciona la extension
if (-not $extension) {
    Write-Host "Debes proporcionar una extensión de archivo"
    exit 
}
# Crear un directorio temporal en C:\temp con el nombre de un usuario ($env:USERNAME)
$directorio = "C:\temp\$env:USERNAME"

# Comprobamos si existe el $directorio: si no existe avisa que no existe, si existe, 
# se crea el directorio temporal en $directorio
if (Test-Path -Path $directorio){
    Write-Host "El directorio existe"
}else{
    New-Item -ItemType Directory -Path $directorio -Force
}
# Se ha creado el directorio en C:\temp\$env:USERNAME,y ahora se copia todos los archivos con $extension

Copy-Item -Path "$env:USERPROFILE\*.$extension" -Destination $directorio -Recurse
Write-Host "Se han copiado los archivos con la extension .$extension al directorio temporal: $directorio"