<#
 Script: 10.ps1
 Fecha: 21/02/2024
 Descripcion:Escribir un script que reciba un nombre de archivo como parámetro e indicar,
              imprimiendo los mensajes que correspondan, si el archivo es legible, modificable y
              ejecutable por el usuario. Pista: cmdlet Get-Acl.
#>
param (
    [string]$nombreArchivo
)

#Borrar pantalla

Clear-Host

# Verificar si el archivo existe

if (-not (Test-Path $nombreArchivo -PathType Leaf)) {
    Write-Host "El archivo '$nombreArchivo' no existe."
    exit
}

# Obtener la lista de control de acceso (ACL) del archivo

$acl = Get-Acl $nombreArchivo

# Obtener el nombre de usuario actual

$usuarioActual = $env:USERNAME

# Verificar si el archivo es legible

$esLegible = $acl.Access -match "Read" -and $acl.Access.IdentityReference -match $usuarioActual
if ($esLegible) {
    Write-Host "El archivo '$nombreArchivo' es legible por el usuario."
} else {
    Write-Host "El archivo '$nombreArchivo' NO es legible por el usuario."
}

# Verificar si el archivo es modificable
$esModificable = $acl.Access -match "Write" -and $acl.Access.IdentityReference -match $usuarioActual
if ($esModificable) {
    Write-Host "El archivo '$nombreArchivo' es modificable por el usuario."
} else {
    Write-Host "El archivo '$nombreArchivo' NO es modificable por el usuario."
}

# Verificar si el archivo es ejecutable
$esEjecutable = $acl.Access -match "ExecuteFile" -and $acl.Access.IdentityReference -match $usuarioActual
if ($esEjecutable) {
    Write-Host "El archivo '$nombreArchivo' es ejecutable por el usuario."
} else {
    Write-Host "El archivo '$nombreArchivo' NO es ejecutable por el usuario."
}
