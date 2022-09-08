Resumen
El paro de servicios de forma no controlada, que deben correr 24/7, ha hecho necesaria la creación de un script que se encargue de controlar el estado de estos, para que en caso de que se encuentren parados, se vuelvan a activar.

Creación de trabajo
Para  que se ejecute el script principal en segundo plano, se puede iniciar un trabajo.
Start-Job -FilePath 'D:\scripts\VerificarServicios\Verificar.ps1'

EjecutarVerificador.ps1
Es el script principal.
Se ejecuta un bucle infinito que inicia Verificar.ps1 cada 60 segundos.
Primero se debe establecer la ruta del script secundario a ejecutar.
Por último, debe establecerse una ruta para el log, donde se guardará la información de posibles errores en la ejecución. Es opcional pero puede ser útil para la detección de posibles errores.

Verificar.ps1
Es el script secundario.
Se encarga de, mediante un bucle foreach, obtener los servicios para encontrar aquellos necesarios para verificar y en caso de que se encuentren parados, volver a iniciarlos.
Por último en el archivo log, se podrá ver a que fecha y hora se han iniciado los servicios que estaban parados. Puede ser útil para posibles predicciones.

Instalación de EjecutarVerificador.ps1 como servicio
# Nombre servicio
$NombreServicio = 'controlServicios'
# Ruta de powershell
$RutaPowershell = 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe'
# Argumentos a pasar al ejecutable de PowerShell:
# ExecutionPolicy para asegurarnos de que no se bloquea la ejecución del script
# File donde indicamos la ruta de nuestro script
$Argumentos= '-ExecutionPolicy Unrestricted -File D:\scripts\VerificarServicios\EjecutarVerificador.ps1'
#instalar como servicio
nssm install $NombreServicio $RutaPowershell $Argumentos
