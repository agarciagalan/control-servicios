# script para ejecutar el verificador cada minuto
for(;;) {
 try {
  # ejecutar script de verificacion
  Start-Job -FilePath <ruta_script_verificacion_ej_C:/scripts/Verificar.ps1>
 }
 catch {
  # pasar $_ a un archivo log
  Add-Content -Value $_ -Path <ruta_log>
 }
 # esperar un minuto
 Start-Sleep 60
}
