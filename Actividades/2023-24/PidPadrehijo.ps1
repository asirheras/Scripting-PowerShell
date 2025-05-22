clear-host
Get-Process | more
# Especifica el PID (-Id) del proceso que estás buscando
$pidABuscar = Read-Host "¿Cual es el PID del proceso?"

# Obtiene el proceso por su PID
$procesoEncontrado = Get-Process -Id $pidABuscar

# Verifica si se encontró el proceso
# Si el proceso es DISTINTO de $null
