# Autor: Andres
# Fecha de creación: 12-12-2024
<# Descripción:  Recibe como parámetro un nombre de archivo y si no se
pasa el parámetro el archivo se llamará fchero.txt por defecto. El script debe
visualizar el nombre del archivo que se ha pasado como parámetro o el nombre
por defecto.
#>

Param (
[string]$nombreArchivo = "fichero.txt" # Valor por defecto si no se pasa un parámetro
)
# Mostrar el nombre del archivo que se ha pasado o el nombre por defecto
Write-Host "El nombre del archivo es: $nombreArchivo"