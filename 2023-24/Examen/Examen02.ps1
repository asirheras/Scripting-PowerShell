[int]$numero1= Read-Host ¿Dame el primer número?
if($numero1 -eq 0)
{Write-hOst "No hago operaciones con el 0"
exit 1}
[int]$numero2= Read-Host ¿Dame el segundo número?
if($numero2 -eq 0){Write-Host "No hago operaciones con el 0"
exit 1}
$suma=$numero1+$numero2
$resta=$numero1-$numero2
$multiplicar=$numero1*$numero2
$dividir=$numero1/$numero2
Write-Host "La suma de estos numero es: "$suma
Write-Host "La resta de estos numero es: "$resta
Write-Host "La multiplicación de estos numero es: "$multiplicar
Write-Host "La división de estos numero es: "$dividir