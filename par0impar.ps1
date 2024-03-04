# Solicitar al usuario que ingrese un número

$numero = Read-Host "Ingresa un número"

# Verificar si el número es par o impar
if ($numero % 2 -eq 0) {
    Write-Host "El número $numero es par."
} else {
    Write-Host "El número $numero es impar."
}