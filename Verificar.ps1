# script para verificar si los servicios indicados estan corriendo
$servicios = <lista_servicios>
foreach ($servicio in $servicios){
    # Si el servicio indicado está apagado
    if (Get-Service -Name $servicio | Where-Object {$_.Status -eq "Stopped"}){
        # Iniciar servicio
        Start-Service $servicio
        # Obtener fecha y hora de activacion
        $fechHora = Get-Date
        # añadir el contenido al archivo log
        Add-Content -Value $fechHora, $servicio, "Servicio iniciado.", "----------------" -Path <Ruta_log>
    }
}
