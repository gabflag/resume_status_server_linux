#!/bin/bash

function show_disk_space() {
  echo "Espaco em disco:"
  echo "-----------------------------------"
  df -h
  echo "-----------------------------------"
}

function show_resource_usage() {
    echo "Consumo de recursos do servidor:"
    echo "-----------------------------------"
    echo "Uso da CPU: $(top -bn1 | grep 'Cpu(s)' | awk '{print $2}')%"
    echo "Uso da memória: $(free | grep Mem | awk '{print ($3/$2 * 100)}')%"
    echo "Uso do disco: $(df | grep '/dev/sda1' | awk '{print $5}')"
    echo "-----------------------------------"
}

function show_top_processes() {
    echo "Os 10 principais processos consumindo recursos:"
    echo "-----------------------------------"
    ps -eo pid,%cpu,%mem,cmd --sort=-%cpu | head -n 11
    echo "-----------------------------------"
}

show_disk_space
show_resource_usage
show_top_processes
