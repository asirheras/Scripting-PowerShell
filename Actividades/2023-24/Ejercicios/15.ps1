Clear-Host
# Verifica si se proporcionaron suficientes argumentos
if ($args.Count -lt 1) {
    Write-Host "Por favor, proporciona al menos la extensión de archivo como argumento."
    exit
}

# Asigna el primer argumento como la extensión de archivo
$extension = $args[0]

# Asigna el segundo argumento como el directorio si se proporciona, de lo contrario utiliza el directorio actual
if ($args.Count -gt 1) {
    $directorio = $args[1]
} else {
    $directorio = (Get-Location).Path
}

# Verifica si el directorio especificado existe
if (-not (Test-Path $directorio)) {
    Write-Host "El directorio especificado no existe."
    exit
}

# Obtener la lista de archivos con la extensión especificada en el directorio
$archivos = Get-ChildItem -Path $directorio -Filter "*.$extension" -File

# Verificar si se encontraron archivos con la extensión especificada
if ($archivos.Count -eq 0) {
    Write-Host "No se encontraron archivos con la extensión .$extension en el directorio $directorio."
} else {
    # Calcular y mostrar el tamaño total de los archivos con la extensión especificada
    $tamañoTotal = 0
    foreach ($archivo in $archivos) {
        $tamañoArchivo = (Get-ItemProperty -Path $archivo.FullName).Length
        Write-Host "$($archivo.Name): $tamañoArchivo bytes"
    }
    # Calcular y mostrar el tamaño total de los archivos con la extensión especificada
    $tamañoTotal = ($archivos | Measure-Object -Property Length -Sum).Sum
    Write-Host "El tamaño total de los archivos .$extension en el directorio $directorio es: $tamañoTotal bytes."
