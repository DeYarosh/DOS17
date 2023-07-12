#!/bin/bash

max_used_cpu=100
free_cpu=$(mpstat | awk '{print $NF}' | sed -n '4p')   #Getting info from sysstat 
current_used_cpu=$(echo "$max_used_cpu-$free_cpu" | bc -l)

echo Текущая загрузка процессора: $current_used_cpu%
echo Свободная Память: $(grep MemFree /proc/meminfo | cut -c18-21)MB
echo IP-адрес: $(ip a | grep -m 1 inet | cut -c10-18)

exit 0

