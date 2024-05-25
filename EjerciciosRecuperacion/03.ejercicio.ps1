function Permisos {
    param (
        [string]$path,
        [string]$user,
        [string]$permission
    )

    # Inicializar $result
    $result = $false

    # Obtener los permisos del archivo o directorio
    $acl = Get-Acl -Path $path -ErrorAction SilentlyContinue -ErrorVariable errorOutput

    # Verificar si se obtuvo correctamente el descriptor de seguridad y si el usuario tiene los permisos adecuados
    if ($acl) {
        $accessRules = $acl.Access | Where-Object { $_.IdentityReference -eq $user }
        foreach ($rule in $accessRules) {
            if ($rule.FileSystemRights.ToString().Contains($permission)) {
                $result = $true
                break
            }
        }
    }

    return $result
}

#---------------------FIN FUNCION--------------------------------|

# Verificar que se han proporcionado los parametros requeridos
if ($args.Count -ne 2) {
    Write-Host "Error: Debe proporcionar dos parametros: un directorio y un nombre de usuario."
    exit 1
}

# Asignar los parametros a variables
$directory = $args[0]
$user = $args[1]

# Comprobar que el primer parametro es un directorio
if (-not (Test-Path -Path $directory -PathType Container)) {
    Write-Host "Error: El primer parametro debe ser un directorio valido."
    exit 1
}

# Crear el directorio C:\tmp\usuario si no existe
$userDir = "C:\tmp\$user"
if (-not (Test-Path -Path $userDir)) {
    New-Item -Path $userDir -ItemType Directory -ErrorAction SilentlyContinue
    if (-not (Test-Path -Path $userDir)) {
        Write-Host "Error: No se pudo crear el directorio $userDir."
        exit 1
    }
}

# Procesar archivos y directorios en el directorio especificado
# Arreglo vacio para errores
$errors = @()

Get-ChildItem -Path $directory -Recurse | ForEach-Object {
    $item = $_.FullName

    if (Test-Path -Path $item -PathType Container) {
        # Si es un directorio
        if (Permisos $item $user "Read") {
            $fileCount = (Get-ChildItem -Path $item).Count
            Write-Host "El directorio $item tiene $fileCount archivos."
        } else {
            # Copiar directorio sin permisos
            Copy-Item -Path $item -Destination $userDir -Recurse -ErrorAction SilentlyContinue
            if (-not (Test-Path -Path "$userDir\$($_.Name)")) {
                $errors += "Error copiando el directorio $item"
            }
        }
    } else {
        # Si es un archivo
        $canModify = Permisos $item $user "Modify"
        $canDelete = Permisos $item $user "Delete"
        
        if ($canModify) {
            Write-Host "El archivo $item puede modificarse por $user."
        } elseif ($canDelete) {
            Write-Host "El archivo $item puede borrarse por $user."
        } else {
            # Copiar archivo sin permisos
            Copy-Item -Path $item -Destination $userDir -ErrorAction SilentlyContinue
            if (-not (Test-Path -Path "$userDir\$($_.Name)")) {
                $errors += "Error copiando el archivo $item"
            }
        }
    }
}

# Comprobar si hubo errores durante la copia
if ($errors.Count -gt 0) {
    $errorFile = "$PSScriptRoot\errores.txt"
    $errors | Out-File -FilePath $errorFile
    Write-Host "Se encontraron errores durante la copia. Detalles:"
    Get-Content -Path $errorFile
} else {
    Write-Host "Proceso completado sin errores."
}
