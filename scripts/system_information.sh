#!/bin/bash

echo "================================================="
clear
echo "Relatorio da maquina: "$(hostname)
echo "Data/Hora: " $(date)
echo "================================================="
echo "Máquina Ativa desde: " $(uptime -s)
echo ""
echo "Versão do Kernel: " $(uname -r)
echo ""
echo "CPUs:"
echo "Quantidade de CPUs/Core:" $(cat /proc/cpuinfo | grep "model name" | wc -l) 
echo "Modelo da CPU:" $(cat /proc/cpuinfo | grep -m1 "model name" | cut -d ":" -f2)
echo ""
echo "Memória Total: " $(free -m | grep Mem | cut -c16-19) "MB"
echo ""
echo "Partições: "
df -h
