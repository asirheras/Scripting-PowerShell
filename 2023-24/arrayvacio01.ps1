# Inicializar un array vacío
Clear-Host
$array = @()

# Agregar elementos al array
$array += "Manzana"
$array += "Banana"
$array += "Naranja"

# Mostrar el contenido del array
Write-Host "Contenido del array:"
foreach ($elemento in $array) {
    Write-Host $elemento
}
