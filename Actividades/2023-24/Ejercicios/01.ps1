
$usuario = $env:USERNAME

$directorioPersonal = $env:USERPROFILE

$fechaDelSistema = Get-Date

Write-Host "Nombre de Usuario: $usuario"
Write-Host "Directorio Personal: $directorioPersonal"
Write-Host "Fecha del Sistema: $fechaDelSistema"