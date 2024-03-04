#Borramos pantalla
Clear-Host

#Incializamos la variable
$val=0

#El While no acaba hasta que val no sea 3
While($val -ne 3)
{
#val++=val+1
$val++
Write-Host $val
}