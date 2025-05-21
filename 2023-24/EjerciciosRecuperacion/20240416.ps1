<#
Autor:Andrés Heras Leiva

Fecha:20240416

Descripción:

Este script realiza lo siguiente :

1. Recibe dos parámetros: un directorio y un patrón de archivo (una cadena de texto sin
caracteres comodines). Comprobar que se reciben ambos parámetros y que el
primero es un directorio. Si no fuera así, en ambos casos hay que terminar el script
con un mensaje de error.

2. Comprobar si existe la carpeta C:\tmp\usuario, siendo usuario el que ejecuta
el script. Si no existe, se crea y se anula la salida de error. Posteriormente hay que
comprobar que la creación del directorio ha tenido éxito. Si no, se acaba el script.

3. Para todos los archivos del directorio (1 er parámetro) cuyo nombre se ajusta al patrón
(2o parámetro) hacer lo siguiente:

    a) Si es un directorio mostrar el número de archivos que contiene. El mensaje a
    visualizar es: El directorio DIRECTORIO tiene NUMERO archivos.

    b) Si es un archivo normal y su tamaño es mayor o igual a 1 KB visualizar su nombre y
    tamaño. El mensaje a visualizar es El archivo NOMBRE tiene un tamaño de
    TAMAÑO bytes.

    c) Los ficheros que no superan el KB se tienen que copiar en el directorio C:\tmp\
    usuario que se ha creado anteriormente. La copia de cada archivo se realiza
    redireccionando la salida de error al fichero errores.txt situado en la misma
    carpeta del script.

4. Cuando finalice el proceso anterior, hay que comprobar si ha habido errores durante
la copia de los archivos. Comprobar si el fichero errores.txt tiene algún contenido y si
lo tiene mostrarlo por pantalla.
           
 
 
           
            #>

# Limpiamos Pantalla
Clear-host

# APARTADO 1.
 
    #Verificar si se reciben exactamente dos parámetros(el directorio y el patron)

if ($args.Count -ne 2) {
    Write-Host "Error: El script debe recibir exactamente dos parámetros."
    exit
}

#Nombramos argumentos

$directorio=$args[0]
$patron=$args[1]

# Verificar si el $directorio es un directorio

if (Test-Path $directorio -PathType Container){
Write-Host "El directorio $directorio existe"}


#----------------------------------------------------------------------------
# APARTADO 2
#---------------------------------------------------------------------------- 
#Obtener el nombre de usuario actual

$usuario = $env:USERNAME

# Definir la ruta del directorio basada en el nombre de usuario actual
    
$dir_usuario = "C:\tmp\$usuario"

# Verificar si el directorio ($dir_usuario) existe
    
if (-not (Test-Path $dir_usuario -PathType Container))# Si $dir_usuario no existe, crearlo
{
   
Write-host "$dir_usuario no existe, y voy a crearlo" 

New-Item -Path $dir_usuario -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
}
else
{              
Write-Host "El directorio $dir_usuario existe."
}


# Verificar si el directorio existe

if (-not (Test-Path $directorio -PathType Container)) {
    Write-Host "El directorio $directorio NO existe."
    exit
}

#--------------------------------------------------------------------------------------
# Apartado 3
#--------------------------------------------------------------------------------------

# Recorrer todos los archivos en el directorio

foreach ($archivo in Get-ChildItem -Path $directorio -Filter $patron) 
{
    if ($archivo.PSIsContainer)  # Si es un directorio, mostrar el número de archivos
    {

        $numArchivos = (Get-ChildItem $archivo.FullName | Measure-Object).Count
        Write-Host "El directorio $($archivo.FullName) tiene $numArchivos archivos."
    } 
    elseif ($archivo.Length -ge 1KB) 
    {

        # Si es un archivo normal y su tamaño es mayor o igual a 1 KB, mostrar nombre y tamaño

        Write-Host "El archivo $($archivo.Name) tiene un tamaño de $($archivo.Length) bytes."
    } 
    else 
    {
       
        # Si el archivo es menor a 1 KB, copiarlo al directorio de destino

        $errorActionPreference = "SilentlyContinue" # PowerShell NO MOSTRARÁ errores en la consola, continuará ejecutando el script.
        Copy-Item -Path $archivo.FullName -Destination $dir_usuario
        if ($?) {
            Write-Host "El archivo $($archivo.Name) se copió correctamente."
        } 
        else 
        {
        <#La copia de cada archivo se realiza redireccionando la salida de error al fichero errores.txt situado en la misma
    carpeta del script.#>
            Write-Host "Hubo un error al copiar el archivo $($archivo.Name)"
            $errorActionPreference = "Continue"
            $error | Out-File -FilePath "$PSScriptRoot\errores.txt"

        }
    }
}
#------------------------------------------------------------------------------
# APARTADO 4
#------------------------------------------------------------------------------
  $contenidoErrores = Get-Content "$PSScriptRoot\errores.txt" -ErrorAction SilentlyContinue
    
    # Verificar si el archivo de errores tiene algún contenido
    if ($contenidoErrores) 
    {
        Write-Host "Se encontraron errores durante la copia de archivos y son estos"
        # Mostrar el contenido del archivo de errores
        Write-Host $contenidoErrores
    } 
    else 
    { Write-Host "`n No ha habido errores en el copiado de archivo/s"

    # Restaurar el comportamiento predeterminado de manejo de errores cambiado en línea 125
    $errorActionPreference = "Continue"
    }
