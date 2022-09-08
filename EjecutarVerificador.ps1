# script para ejecutar el verificador cada minuto
for(;;) {
 try {
  # ejecutar script de verificacion
  Start-Job -FilePath D:\scripts\VerificarServicios\Verificar.ps1
 }
 catch {
  # pasar $_ a un archivo log
  Add-Content -Value $_ -Path D:\scripts\VerificarServicios\log.txt
 }
 # esperar un minuto
 Start-Sleep 60
}
