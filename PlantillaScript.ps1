# Pedir al usuario que ingrese el nombre del autor del script
$autor = Read-Host "Ingrese el nombre del autor del script"

# Obtener la fecha actual
$fecha = Get-Date -Format "dd-MM-yyyy"

# Pedir al usuario que ingrese una breve descripción del script
$descripcion = Read-Host "Ingrese una breve descripción del script"

# Definir el contenido del script con los comentarios
$contenidoScript = @"
# Autor: $autor
# Fecha de creación: $fecha
# Descripción: $descripcion

# Inserte aquí el código del script...

"@

# Pedir al usuario la ubicación donde desea crear el archivo
$rutaArchivo = Read-Host "Ingrese la ubicación donde desea crear el archivo"

# Crear el archivo .ps1 en la ubicación especificada
$archivo = Join-Path -Path $rutaArchivo -ChildPath "MiScript.ps1"
$contenidoScript | Out-File -FilePath $archivo -Encoding utf8

# Abrir el archivo en PowerShell ISE
Start-Process "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell_ise.exe" $archivo

