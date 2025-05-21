#Llamadas WMI
$ComputerSystem=Get-WmiObject Win32_ComputerSystem
$BaseBoard=Get-WmiObject Win32_BaseBoard
$BIOS=Get-WmiObject Win32_BIOS
$Processor=Get-WmiObject Win32_Processor
$Battery=Get-WmiObject Win32_Battery
$programas=Get-Package
$controladores=Get-Process -Module
 
#Crear un objeto con todos los datos sobre el hardware
$equipo=[PSCustomObject]@{
 Model = $ComputerSystem.Model
 ManufacturerBoard = $BaseBoard.Manufacturer
 BIOSVersion = $BIOS.SMbiosbiosversion
 BIOSSerialNumber = $BIOS.serialnumber
 ManufacturerProcessor=$Processor.Manufacturer
 MaxClockSpeed=$Processor.MaxClockSpeed
 Cargadelprcesador=$Processor.LoadPercentage
 programas=$programas.name
 conontroladores=$controladores
}
 
$equipo.programas
$equipo.conontroladores