Clear-Host
[string]$nombre = Read-Host ¿Cómo te llamas?
[int]$edad = Read-Host ¿Cuál es su edad?
if ($edad -ge 18){
Write-Host "Eres mayor de edad"
$pregunta=Read-Host "¿Quieres añadir algo?(S/N)?"
if ($pregunta -eq "S")
       {$Comentario=Read-Host "Comenta en una breve parrafo"
       Write-Host $Comentario
       exit 1
       }
else {exit 1}}
else {Write-Host "$nombre eres MENOR de edad"}