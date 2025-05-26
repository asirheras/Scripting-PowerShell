<#
Autor:
Fecha:
Descripción:Escribir un script que visualiza por pantalla la fecha actual, y opcionalmente la hora,
            en formato: Hoy es dia de mes de año y son las hora horas y minutos minutos.#>


#Obtener la fecha y hora actual
$fechaHoraActual = Get-Date

#Formatear la fecha
$fechaFormateada = "Hoy es {0:D}" -f $fechaHoraActual

#Si añadimos el argumento "-hora" :Formatear la hora (opcional)
if ($args[0] -eq "-hora") {
    $horaFormateada = "son las {0:HH} horas y {0:mm} minutos"  -f $fechaHoraActual
} 
    #Mostrar la fecha y hora
    if ($horaFormateada) {
    Write-Host "$fechaFormateada y $horaFormateada."
    } else {
    write-host $fechaFormateada
}
   