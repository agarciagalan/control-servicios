# script para verificar si los servicios indicados estan corriendo
foreach ($servicio in Get-Service){
    # Si los servicios que empiezan por DLM y EN BATCH v13 están apagados
    if(($servicio.ServiceName -like "DLM*") -or ($servicio.ServiceName -eq "EN BATCH v13") -and ($servicio.Status -eq "Stopped"))
    {
        # Iniciar servicio
        Start-Service $servicio
        # Obtener fecha y hora de activacion
        $fechHora = Get-Date
        # añadir el contenido al archivo log
        Add-Content -Value $fechHora, $servicio, "Servicio iniciado.", "----------------" -Path "D:\scripts\VerificarServicios\log.txt"
    }
}
