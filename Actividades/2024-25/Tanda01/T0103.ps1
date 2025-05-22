# Autor: Andres
# Fecha de creación: 12-12-2024
<# Descripción: Solicita al usuario una dirección IP o un nombre de host y
realice un ping a esa dirección. El resultado del ping debe mostrarse en consola.
#>

$dirección=Read-Host "Dame una ip o nombre de host"

$ping = Test-Connection -ComputerName $dirección -Count 4

if($ping){
Write-Host "El ping a $dirección ha sido exitoso"
}else{
Write-Host "No hay conexión a $dirección"
}






