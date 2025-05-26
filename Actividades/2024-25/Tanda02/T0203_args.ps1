# Autor: Andres
# Fecha de creación: 12-12-2024
<# Descripción: Recibe dos parámetros: un directorio y un patrón de archivo (una cadena de
texto sin caracteres comodines). Comprobar que se reciben ambos parámetros y
que el primero es un directorio. Si no fuera así, en ambos casos hay que terminar
el script con un mensaje de error
#>

# Usar los argumentos de la línea de comandos
$Directorio = $args[0]
$Patron = $args[1]

# Comprobación de parámetros
if (-not $Directorio -or -not $Patron) {
    Write-Host "Error: Tiene que pasar 2 parámetros: <directorio> <patrón>" -ForegroundColor Red
} else {

    # Verificar si el primer parámetro es un directorio válido
    if (-not (Test-Path -Path $Directorio -PathType Container)) {
        Write-Host "Error: '$Directorio' no es un directorio válido." -ForegroundColor Red
    } else {
        Write-Host "El directorio pasado es: '$Directorio' y el patrón es: '$Patron'" -ForegroundColor Green
    }
}