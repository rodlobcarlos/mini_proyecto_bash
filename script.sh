#!/bin/bash

# Script en bash para obtener la información de estos valores: CPU, RAM, Disco, Servicios, Connectividad y Espacio disponibles.
{
    echo "=== INFORMACION DE LA CPU ==="
    # Muestra el modelo de la CPU en el sistema
    eval $(LC_ALL=C lscpu | awk -F': +' '
    /^Architecture:/ {print "CPU_ARCH=\"" $2 "\""}
    /^Model name:/ {print "CPU_MODEL=\"" $2 "\""}
    /^CPU\(s\):/ {print "CPU_THREADS=\"" $2 "\""}
    /^Core\(s\) per socket:/ {print "CPU_CORES_PER_SOCKET=\"" $2 "\""}
    ') 
    echo "Modelo: $CPU_MODEL"
    echo "Arquitectura: $CPU_ARCH"
    echo "Hilos totales: $CPU_THREADS"
    echo "Núcleos por socket: $CPU_CORES_PER_SOCKET"

    echo # Agrega una línea en blanco para separar la información
    echo "=== INFORMACION DE LA RAM ==="
    # Muestra la información de la memoria RAM disponible en el sistema
    cat /proc/meminfo | head -n 4

    echo
    echo "=== INFORMACION DEL DISCO ==="
    df -h

    echo
    echo "=== INFORMACION DE LOS SERVICIOS ==="
    # Muestra los primeros 10 servicios en ejecución en Linux
    echo "=== SERVICIOS EN EJECUCION ==="
    systemctl list-units --type=service --state=running
    echo
    echo "=== TODOS LOS SERVICIOS ==="
    systemctl list-unit-files --type=service
    echo
    echo "=== SERVICIOS QUE HAN FALLADO ==="
    systemctl --failed --type=service
    echo
    echo "=== SERVICIOS QUE SE PUEDEN ACTUALIZAR === "
    sudo apt update 
    apt list --upgradable

    echo
    echo "=== INFORMACION DE CONECTIVIDAD ==="
    # Muestra los primeros 15 puertos en escucha y conexiones establecidas en el sistema
    ss -tuln | grep -E "LISTEN|ESTAB" | head -n 15

    echo
    echo "=== INFORMACION DE ESPACIO DISPONIBLE ==="
    # Muestra la información de los discos físicos en el sistema
    df -h -x tmpfs -x devtmpfs -x squashfs --output=source,target,size,avail
} > informe.txt