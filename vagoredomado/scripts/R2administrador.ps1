<#
Autor:Andres Heras
Fecha:20241231
Descripción: Este script advierte si estás usando el modo Administrador o no.
#>

$IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ($IsAdmin) {
    #Write-Host
    Write-Host "`n✅ Estás en modo Administrador." -ForegroundColor Green
} else {
    Write-Host "`n❌ No estás en modo Administrador." -ForegroundColor Red
}