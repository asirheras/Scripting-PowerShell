<#
Escribir un script que reciba varios nombres de archivos de texto como parametros y
los una en un solo archivo cuyo nombre sera la cadena resultado mas el nombre del
script y la fecha y hora actual con una precision de hasta segundos. Todos los
archivos estan en la carpeta Documents del perfil de usuario.
#>

param (
    [Parameter(ValueFromRemainingArguments=$true )]
    [string[]]$archivos
)
Clear-Host
if ($archivos.Count -eq 0){
    Write-Host "Debe introducir al menos un parametro"
    exit
}
$carpetaDocumentos="$($env:USERPROFILE)\Documentos"
if (-not (Test-Path $carpetaDocumentos)){
    Write-Host "No ha podido acceder a $($carpetaDocumentos"
    exit

}
$nombrefinal="Resultado_$($MyInvocacion.MyCommand.Name)_$(Get-Date -Form "yyyyMMdd_HHmmss")"
$rutafinal="$($carpetaDocumentos)\$($nombrefinal).txt"


foreach ($archivo in $archivos){
    if(-not (Test-Path $archivo)){
        Write-Host "Error:El archivo $archivo no existe"
        exit
    }
}
$contenidofinal = Get-Content $archivos | Out-String
$contenidofinal | Out-File -FilePath $rutafinal -Encoding UTF8
Write-Host "Archivos combinados existosamente. Resultado guardado en: $rutafinal"