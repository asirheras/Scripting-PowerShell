#cambiando el parametro de $true ó $false tendremos un versión extendida de la fecha ó
#versión corta.

param (
    [bool] $modoextendido = $false
)

Clear-Host

if ($modoextendido)
{
    $dia = Get-Date -Format dd
    $mes = Get-Date -Format MM
    $ano = Get-Date -Format yyyy
    $hora = Get-Date -Format HH
    $minutos = Get-Date -Format mm 

Write-Host "Hoy es $dia de $mes de $ano. Son las $hora horas y $minutos minutos"
} else {
    Get-Date
}