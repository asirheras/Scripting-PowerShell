

$estado = $args[0]
<#
1.Recibe un parametro que puede ser uno de los siguientes: Ejecucion, Parado. 
Comprobar que se recibe el parametro y que su valor es alguno de los admitidos. Si
no fuera así, hay que terminar el script con un mensaje de error que muestre la
sintaxis del script.
#> 

if (-not ($estado -eq "Ejecucion" -or $estado -eq "Parado")){
    Write-Host "Sintaxis del script: script.ps1 <Ejecucion|Parado>"
    exit
}

<#
Realizar un listado de los servicios que se encuentran en el estado indicado por el
 parametro pasado.
 #>
  
 if ($estado -eq "Ejecucion") {
    $servicios = Get-Service | Where-Object { $_.Status -eq "Running"}
                             }
else {
    $servicios = Get-Service | Where-Object { $_.Status -eq "Stopped" }
}
 
 <#Para cada servicio habra que hacer lo siguiente:
 a) Si esta en ejecucion y el servicio puede ser pausado y reanudado hay que
 mostrar la descripcion del servicio.

 b) Si esta en ejecucion y el servicio puede ser parado hay que mostrar los servicios
 que dependen de el.
 c) Si esta parado hay que mostrar el tipo de inicio. En funcion del tipo de inicio hacer
 lo siguiente:
    � Si el tipo de inicio es manual hay que arrancar el servicio. Comprobar el
    arranque y mostrar un mensaje indicado si ha arrancado o no.
    � Si es inicio retrasado mostrar el tipo de servicio.
    � Si el servicio esta deshabilitado mostrar el mensaje El servicio NOMBRE esta
 deshabilitado.
#>

# Obteniendo la lista de servicios segun el estado especificado


# Contador de servicios

$numServicios = 0

# Iterando sobre cada servicio

foreach ($servicio in $servicios) {
    $numServicios++

#a) Si esta en ejecucion y el servicio puede ser pausado y reanudado hay que mostrar la descripcion del servicio.

    if ($estado -eq "Ejecucion") {
        if ($servicio.CanPauseAndContinue) {
            Write-Host "Descripcion del servicio $($servicio.DisplayName): $($servicio.Description)"

#b) Si esta en ejecucion y el servicio puede ser parado hay que mostrar los servicios que dependen de el.

        } elseif ($servicio.CanStop) {
            Write-Host "Servicios que dependen de $($servicio.DisplayName):"
            Get-Service | Where-Object { $_.DependentServices.DisplayName -contains $servicio.DisplayName } | ForEach-Object { Write-Host " - $($_.DisplayName)" }
        }
    } else {
        Write-Host "Tipo de inicio del servicio $($servicio.DisplayName): $($servicio.StartType)"
        if ($servicio.StartType -eq "Manual") {
            $servicio.Start() 
            $servicio.Refresh()
            if ($servicio.Status -eq "Running") {
                Write-Host "El servicio $($servicio.DisplayName) ha sido arrancado."
            } else {
                Write-Host "El servicio $($servicio.DisplayName) no pudo ser arrancado."
            }
        } elseif ($servicio.StartType -eq "Disabled") {
            Write-Host "El servicio $($servicio.DisplayName) está deshabilitado."
        }
    }
}

# Mostrando el numero total de servicios en el listado
Write-Host "Total de servicios: $numServicios"
