<#
Autor:
Fecha:
Descripción:Escribir un script que muestra en pantalla el nombre del usuario que ejecuta el script,
su directorio personal y la fecha del sistema.#>
# Nombre del usuario actual
# La variable del usuario actual es la $env:USERNAME, nosotros la igualamos para llamarla $nombreUsuario
$nombreUsuario = $env:USERNAME

# Directorio personal del usuario actual
# La variable del usuario actual es la $env:USERPROFILE, nosotros la igualamos para llamarla $directorioPersonal
$directorioPersonal = $env:USERPROFILE

# Fecha del sistema
# La variable de la fecha del sistema es la Get-Date, aunque no es una variable, nosotros la igualamos para llamarla $fechaSistema
$fechaSistema = Get-Date

# Muestra la información en pantalla
Clear-Host
Write-Host "Nombre de usuario: $nombreUsuario"
Write-Host "Directorio personal: $directorioPersonal"
Write-Host "Fecha del sistema: $fechaSistema"