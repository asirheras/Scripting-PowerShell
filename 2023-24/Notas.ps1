clear host
# Pedir al usuario que ingrese la nota
[double]$nota = Read-Host "¿Qué nota has sacado?"

# Utilizar el comando switch para evaluar la nota
switch ($nota) {
    { $_ -lt 5 } { Write-Host "Has suspendido" }
    { $_ -ge 5 -and $_ -le 7 } { Write-Host "Has aprobado" }
    { $_ -gt 7 -and $_ -le 9 } { Write-Host "Felicidades por el notable" }
    { $_ -gt 9 } { Write-Host "Enhorabuena por el sobresaliente" }
    Default { Write-Host "La nota ingresada no es válida" }
}
