#!/bin/bash
disk_usage=$(df -h / | awk 'NR==2{print $5}')
memory_usage=$(free | awk 'NR==2 {print ($3/$2)*100}')
cpu_usage=$(top -bn1 | awk '/%Cpu/ {print 100 - $8}')
top_processes=$(ps aux --sort=-%cpu | head -n 6)
echo "================================================"
echo "             SYSTEM RESOURCE MONITOR"
echo "================================================="
echo "CPU Usage    : $cpu_usage%"
echo "Memory Usage : $memory_usage%"
echo "Disk Usage   : $disk_usage"
echo "Top Processes : $top_processes"
if (( ${cpu_usage%.*} > 80 ))
then
echo "WARNING: High CPU usage!"
fi
if ((${memory_usage%.*} > 80 ))
then
echo "WARNING: High Memory usage!"
fi


