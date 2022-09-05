# script para verificar si los servicios indicados estan corriendo
$servicios = <lista_servicios>
foreach ($servicio in $servicios){
    $nombre = $servicio
    $estado = (Get-Service $servicio | Select-Object status)
    write-host $estado
    # Si el servicio indicado está apagado
    if ($estado -like "*Stopped}"){
        # Iniciar servicio
        Start-Service $servicio
        # Obtener fecha y hora de activacion
        $fechHora = Get-Date
        # Establecer contenido del log
        $contenido = $fechHora, $nombre, "Servicio iniciado."
        # añadir el contenido al archivo log.txt
        Add-Content -Value $contenido -Path <Ruta_log>
    }
}
