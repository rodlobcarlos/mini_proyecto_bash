# Mini Proyecto Bash: Monitor de Sistema

Script en Bash diseñado para auditar el estado de un sistema Linux y generar un informe completo en texto plano (`informe.txt`).

## Características Principales

El script recopila automáticamente las siguientes métricas del sistema:

* **CPU:** Modelo del procesador, arquitectura, hilos totales y núcleos por socket (`lscpu`).
* **Memoria RAM:** Resumen del estado y disponibilidad de la memoria (`/proc/meminfo`).
* **Discos y Espacio Disponible:** Uso general de discos y detalle de discos físicos excluyendo sistemas de archivos temporales (`df -h`).
* **Servicios del Sistema:**
  * Servicios activos en ejecución (`systemctl list-units`).
  * Listado completo de servicios instalados (`systemctl list-unit-files`).
  * Servicios con fallos (`systemctl --failed`).
* **Actualizaciones:** Comprobación de paquetes actualizables mediante `apt`.
* **Conectividad:** Primeros 15 puertos en escucha y conexiones establecidas (`ss -tuln`).
* **Exportación:** Guarda toda la salida estructurada por secciones en el archivo `informe.txt`.

## Estructura del Repositorio

* `script.sh`: Script principal en Bash encargado de recolectar los datos del sistema y generar el informe.
* `informe.txt`: Archivo de salida en texto plano con los resultados generados tras la ejecución del script.
* `README.md`: Documentación del proyecto.

## Requisitos Previos

* Sistema operativo Linux basado en Debian/Ubuntu (para la comprobación de paquetes con `apt`).
* Permisos de superusuario (`sudo`) para ejecutar `apt update`.
* Utilidades estándar de Linux: `lscpu`, `df`, `ss` y `systemctl`.

## Uso

1. Clona el repositorio y accede al directorio:
   ```bash
   git clone [https://github.com/rodlobcarlos/mini_proyecto_bash.git](https://github.com/rodlobcarlos/mini_proyecto_bash.git)
   cd mini_proyecto_bash
   ```

2. Dale permisos de ejecución al script
  ```bash
  chmod +x script.sh
  ```

3. Ejecuta el script:
  ```bash
  bash script.sh
  ```

4. Consulta el informe generado:
  ```bash
  cat informe.txt
  ```  
