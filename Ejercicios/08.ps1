<#
 Script: actividad08.ps1
 Fecha: 22/01/2024
 Descripción:Escribir un script que reciba como parámetro un número de MB y visualiza cuantos
bytes son.
#>
clear-host

# Solicitar al usuario que ingrese el número de MB
[double]$megabytes = Read-Host "Ingrese la cantidad de MB"

# Validar que la entrada sea un número
if (-not ($megabytes -as [double])) {
    Write-Host "Por favor, ingrese un valor numérico."
    exit
}
# Calcular la cantidad de bytes
[double]$bytes = $megabytes * 1024

# Mostrar el resultado
Write-Host "$megabytes MB son $bytes"