<#
 Script: 09.ps1
 Fecha: 22/01/2024
 Descripcion:Escribir un script que recibe tres parámetros que son nombres de archivos y
             visualizar la suma del espacio que ocupan. Pista: cmdlet Get-ItemProperty.

 Ejemplo:09.ps1 archivo01.txt archivo02.txt archivo03.txt

#>



param (
    [string[]]$archivos
)


#Borrar pantalla

Clear-Host


# Verificar que se hayan proporcionado exactamente tres archivos como argumentos

if ($archivos.Count -ne 3) {
    Write-Host "Debes proporcionar exactamente tres archivos como argumentos."
    exit
}

# Verificar que todos los archivos proporcionados existen

foreach ($archivo in $archivos) {
    if (-not (Test-Path $archivo -PathType Leaf)) {
        Write-Host "El archivo '$archivo' no existe o no es un archivo válido."
        exit
    }
}

<# 



OPCION 01



Obtener información sobre el tamaño de cada archivo

# Asegurar que la variable esté en un estado predefinido y limpio (arreglo vacio)

$tamanos = @()


foreach ($archivo in $archivos) {
    $tamanos += (Get-ItemProperty -Path $archivo).Length
}

# Calcular la suma de los tamaños de los archivos contenidos en el arreglo $tamanos 
# y almacena este valor en la variable $sumaTamanos.

$sumaTamanos = ($tamanos | Measure-Object -Sum).Sum

# Mostrar la suma de los tamaños de los archivos

Write-Host "La suma del espacio ocupado por los archivos es: $sumaTamanos bytes"

#>




# Obtener información sobre el tamaño de cada archivo y calcular la suma de los tamaños
# Incializamos la variable
$sumaTamanos = 0

foreach ($archivo in $archivos) {
    $tamanoArchivo = (Get-ItemProperty -Path $archivo).Length
    $sumaTamanos += $tamanoArchivo
}

# Mostrar la suma de los tamaños de los archivos
Write-Host "La suma del espacio ocupado por los archivos es: $sumaTamanos bytes"

