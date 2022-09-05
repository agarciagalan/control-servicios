Resumen
El paro de servicios de forma no controlada, que deben correr 24/7, ha hecho necesaria la creación de un script que se encargue de controlar el estado de estos, para que en caso de que se encuentren parados, se vuelvan a activar.

Creación de trabajo
Para  que se ejecute el script principal en segundo plano, se puede iniciar un trabajo.
Start-Job -FilePath <ruta_EjecutarVerificador.ps1>

EjecutarVerificador.ps1
Es el script principal.
Se ejecuta un bucle infinito que inicia Verificar.ps1 cada 60 segundos.
Primero se debe establecer la ruta del script secundario a ejecutar.
Por último, debe establecerse una ruta para el log, donde se guardará la información de posibles errores en la ejecución. Es opcional pero puede ser útil para la detección de posibles errores.

Verificar.ps1
Es el script secundario.
Se encarga de, mediante un bucle foreach, obtener los estados de los servicios indicados y en caso de que el servicio se encuentre parado volver a iniciarlo.
Primero debe indicar la lista de servicios que se desea controlar la ejecución.
Por último establecer una ruta para el archivo log, donde se podrá ver a que fecha y hora se han iniciado los servicios que estaban parados. Puede ser útil para posibles predicciones.

Instalación de EjecutarVerificador.ps1 como servicio
# Nombre servicio
$NombreServicio = 'controlServicios'
# Ruta de powershell
$RutaPowershell = 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe'
# Argumentos a pasar al ejecutable de PowerShell:
# ExecutionPolicy para asegurarnos de que no se bloquea la ejecución del script
# File donde indicamos la ruta de nuestro script
$Argumentos= '-ExecutionPolicy Unrestricted -File <ruta_script>'
#instalar como servicio
nssm install $NombreServicio $RutaPowershell $Argumentos
