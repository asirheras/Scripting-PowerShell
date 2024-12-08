Clear-Host

if ($args.Count -eq 0){
    Write-Host "Escriba un directorio como argumento"
    return
}

$directorio=$args[0]
# Comprobar si el directorio existe
if (Test-Path $directorio -PathType Container){

    $directorios = Get-ChildItem -Path $directorio -Directory -Recurse -Attributes Directory 

    if ($directorios.Count -gt 0) {
        # Mostrar los directorios encontrados
        foreach ($dir in $directorios) {
            Write-Output "$($dir.FullName)"
            }
        
    } else{ 
        Write-Host "No se han encontrado subdirectorios en '$directorio'"
        exit 2
    }
    
}else{ 
    Write-Host "El directorio: '$directorio' no existe. Introduzca una ruta de acceso válida a un directorio."
}