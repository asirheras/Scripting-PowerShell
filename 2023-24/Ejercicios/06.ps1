<#
<#
Script:Variables de entorno
Autor:Andrés Heras
Fecha:2023016
Descripción:Escribir un script que reciba varios nombres de archivos de texto como parámetros y
            los una en un solo archivo cuyo nombre será la cadena resultado más el nombre del
            script y la fecha y hora actual con una precisión de hasta segundos. Todos los
            archivos están en la carpeta Documents del perfil de usuario.

Ejemplo: 

#Ejecuta en una ventana de PowerShell ".\Ejercicio6.ps1 hola mundo donde estas"

#>

Clear-Host

[string]$nombre_fichero
[datetime] $fecha_hora = Get-Date
[string]$script

# Visualizamos los argumentos que se han pasado
#Write-Host "Numero de parametros: " $args.Count

if ( $args.Count -gt 0 ) {
    # encadenamos todos los parametros
    foreach ( $par in $args ) {
    #Write-Host "Parametro: " $par
    $nombre_fichero+=$par
    }
  
    #Tengo que coger solo en nombre eliminando "./" del inicio y ".ps1" del final
    #Con Substring extraigo desde la posicion 2 (ya elimino "./") y hasta el tamaï¿½o -6 (-6 es la suma de los caracteres ./ y .ps1, asï¿½ obtengo solo el nombre
    $script=$^.ToString().Substring(2,$^.Length-6)
    
    #Almacenamos el nombre completo en $nombre_fichero
    #Sustituyo los caracteres especiales "/" y ":" que no se permiten para nombres por "_"
    $nombre_fichero += $script +$fecha_hora.ToString().Replace(" ","_").Replace("/","_").Replace(":","_")


    #Creamos el fichero en la carpeta Documentos del usuario
    New-Item -Path $home\Documents -Name $nombre_fichero -ItemType File -Force
}
else{
    Write-Host "Debes introducir algun parametro"
}
