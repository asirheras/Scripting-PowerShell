# Autor: Andres
# Fecha de creación: 12-12-2024
<# Descripción: Crea un script que copie todos los archivos de la carpeta C:\Datos a una carpeta
de respaldo C:\Backup\Datos. El script debe crear la carpeta de respaldo si no
existe y debe agregar un sufjo con la fecha actual al nombre de la carpeta de
destino (por ejemplo, C:\Backup\Datos_2024-10-17).
#>
$fecha=(Get-Date).ToString("yyyyMMdd")
$rutaDestino="C:\Backup\Datos_$fecha"
Copy-Item -Path C:\Logs\* -Destination $rutaDestino -Recurse
