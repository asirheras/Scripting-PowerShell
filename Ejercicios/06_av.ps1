<#
 Script: 06.ps1
 Fecha: 22/01/2024
 Descripcion:Script que recibe varios nombres de ARCHIVOS DE TEXTO como PARAMETROS y
los una en un solo archivo, cuyo nombre sera la cadena "resultado" mas el "nombre del
script" y la fecha y hora actual con una precision de hasta segundos. Todos los
archivos estan en la carpeta Documents del perfil de usuario.
#>


#Definimos las variables que usará el script: En este caso es $archivos, que será de tipo cadena (string) y 
#recibira un array (lista o matriz) de cadenas ([string[]])

param(
    [string[]]$archivos
)

# Verifica si existen argumentos
# Verificar si se proporcionaron argumentos
if (-not $archivos) {
    Write-Host "Error: No se proporcionaron archivos como argumentos. Debe añadir argumentos separados por comas."
    exit
}

# Obtiene la ruta de la carpeta Documents del perfil de usuario
$carpetaDocuments = [System.IO.Path]::Combine($env:USERPROFILE, 'Documentos')

# Verifica si la carpeta Documents existe
if (-not (Test-Path $carpetaDocuments -PathType Container)) {
    Write-Host "La carpeta Documents no se encontró en el perfil de usuario."
    exit
}

# Construye el nombre del archivo de resultado
$nombreResultado = "resultado_" + $MyInvocation.MyCommand.Name + "_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".txt"
$rutaResultado = [System.IO.Path]::Combine($carpetaDocuments, $nombreResultado)

# Inicializa el contenido del archivo de resultado
$resultado = @()

# Itera a través de cada archivo y agrega su contenido al resultado
foreach ($archivo in $archivos) {
    $rutaArchivo = [System.IO.Path]::Combine($carpetaDocuments, $archivo)

    # Verifica si el archivo existe
    if (Test-Path $rutaArchivo -PathType Leaf) {
        # Agrega el contenido del archivo al resultado
        $contenidoArchivo = Get-Content $rutaArchivo
        $resultado += $contenidoArchivo
    } else {
        Write-Host "El archivo '$archivo' no se encontro en la carpeta Documentos."
    }
}

# Guarda el resultado en el archivo de resultado
$resultado | Set-Content $rutaResultado

Write-Host "¡¡Archivos combinados con EXITO!!. El resultado se guardó en: $rutaResultado"
