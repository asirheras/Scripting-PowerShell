#variables de tipo booleano
[bool]$ hayararchivos=$false
write-host "Tenemos más archivos? $hayararchivos"

#variables de tipo fecha
[datetime] $fechanacimiento ="10/9/2020 21:15:48"
write-host "El bebe nació el $fechanacimiento"

#Ahora vamos acceder campos de tipo datetime

write-host "El mes de nacimiento es $($fechaNacimiento.Month)"

write-host "El mes de nacimiento es $($fechaNacimiento.Day)"
write-host "El mes de nacimiento es $($fechaNacimiento.Year)"