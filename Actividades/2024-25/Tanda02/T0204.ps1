# Autor: Andres
# Fecha de creación: 12-12-2024
<# Descripción: Comprobar si existe la carpeta C:\tmp\usuario, siendo usuario el que ejecuta el
script. Si no existe, se crea y se anula la salida de error. Posteriormente hay que
comprobar que la creación del directorio ha tenido éxito. Si no, se acaba el script.
#>

# Formamos la ruta utilizando el nombre del usuario que ejecuta el script
$rutaCompleta = "C:\tmp\$env:USERNAME"

# Comprobamos si la carpeta existe
if (-not (Test-Path -Path $rutaCompleta)) {

# Creamos la carpeta
New-Item -Path $rutaCompleta -ItemType Directory

# Comprueba si la creación ha sido exitosa
    if (-not (Test-Path -Path $rutaCompleta)) {
    Write-Host "Error: No se pudo crear el directorio $rutaCompleta."
    }else{
    Write-Host "La carpeta $rutaCompleta se creo correctamente"
    }
}else{
Write-Host "La carpeta $rutaCompleta ya existe"
}