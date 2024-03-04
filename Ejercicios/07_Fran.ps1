<# 
Autor:Andrés Heras
Fecha:20240122
Descripción Crear un script que reciba como PARÁMETRO el nombre de una carpeta(RUTA) y genere un
archivo empaquetado y comprimido de esa carpeta como copia de seguridad. 
Pista:
cmdlet Compress-Archive.

#>
param(
    [string]$nombreCarpeta
)
Clear-Host
#Comfirmamos que la carpeta existe
if (-not (Test-Path $nombreCarpeta -PathType Container)){
    Write-Host "La carpeta $nombreCarpeta no existe"
    exit
}
#Creamos el nombre de carpeta comprimida
$nameZip ="$($nombreCarpeta)-Backup_$(Get-Date -Format "yyyyMMdd_HHmmss").zip"
#Y Comprimimos la carpeta con el nombre creado (nameZip)
Compress-Archive -Path $nombreCarpeta -Destination $nameZip -Force
Write-Host "Archivo $($rutaZip) generado. Carpeta respalda con exito"