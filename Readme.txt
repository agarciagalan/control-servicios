El script principal es EjecutarVerificador.
Se ejecuta un bucle infinito ya que consume menos recursos que ejecutar el script desde el scheduler.
Primero se debe establecer la ruta del script secundario a ejecutar.
Por último se debe establecerse una ruta para el log donde se guardará la información de posibles errores en la ejecución. Es opcional pero puede ser útil para la detección de posibles errores.

El scrpt secundario será Verificar.ps1 donde se debe indicar la lista de servicios que se desea controlar la ejecución.
Se encarga de, mediante un bucle foreach, obtener los estados de los servicios indicados y en caso de que el servicio se encuentre parado volver a iniciarlo.
Se debe indicar una ruta para el archivo log, donde se podrá ver a que fecha y hora se han iniciado los servicios que estaban parados para posibles predicciones.
