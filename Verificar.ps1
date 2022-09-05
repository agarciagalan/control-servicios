# script para verificar si los servicios indicados estan corriendo
$servicios = <lista_servicios>
foreach ($servicio in $servicios){
    $estado = (Get-Service $servicio | Select-Object status)
    # Si el servicio indicado está apagado
    if (Get-Service -Name $servicio | Where-Object {$_.Status -eq "Stopped"}){
        # Iniciar servicio
        Start-Service $servicio
        # Obtener fecha y hora de activacion
        $fechHora = Get-Date
        # Establecer contenido del log
        $contenido = $fechHora, $servicio, "Servicio iniciado."
        # añadir el contenido al archivo log
        Add-Content -Value $contenido -Path <Ruta_log>
    }
}
