<#
Autor:Andrés Heras Leiva

Fecha:20240304

Descripción:Escribir un script que muestra en pantalla el nombre 
            del usuario que ejecuta el script, su directorio personal y 
            la fecha del sistema.
Ejemplo:
            .\02_.ps1 hola.txt "H:\Mi unidad\ASIR\2°ASIR2324\2º_ASIR2324_Asignaturas\HLC\Powershell\Github\Scripting-PowerShell\Ejercicios" 
            El archivo H:\Mi unidad\ASIR\2°ASIR2324\2º_ASIR2324_Asignaturas\HLC\Powershell\Github\Scripting-PowerShell\Ejercicios\hola.txt EXISTE.           
            
            #>

# Declaramos las variables que serán posteriormente los parámetros
# Introducimos dos parámetros, en el orden que los vamos a buscar

param (
    [string]$nombreArchivo,
    [string]$directorio
)

# Limpiamos Pantalla
Clear-host

# Formar la ruta completa
# Join-Path es el comandlet
# -Path sirve para encontrar el directorio, es decir, las rutas de directorios
# -ChildPath, hijo de la ruta sirve para introducir el $nombreArchivo

$rutaCompleta = Join-Path -Path $directorio -ChildPath $nombreArchivo

# Verificar si el archivo existe
# Test-Path, sirve para verificar si la ruta construida ($rutaCompleta) está bien o no, 
# y posteriormente con el if comprobamos si el archivo existe o no

if (Test-Path $rutaCompleta -PathType Leaf) {
    Write-Host "El archivo $rutaCompleta EXISTE."
} else {
    Write-Host "El archivo $rutaCompleta NO existe."
}