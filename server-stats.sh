#!/bin/bash

# =====================================================
# Script Name   : server-stats.sh
# Author        : Pasidu
# Created Date  : 2025-12-18
# Last Updated  : 2025-12-18
# Description   : Displays CPU, memory, disk usage, 
#                 top processes, OS info and uptime.
# Version       : 1.0
# =====================================================

echo -e "Total CPU Usage : "
top -bn1 | grep -i "Cpu(s)"

echo -e "\n\nMemory :"
free | awk '/Mem:/ {printf "Free Memory : %s  ",$4;printf "As Percentage : %.2f%%\n",$4/$2*100;printf "Used Memory : %s  ",$3;printf "As Percentage : %.2f%%\n",$3/$2*100}'

echo -e "\n\nDisk Usage :"
df | awk '/\/dev\/sda2/ {printf "Used Memory : %s  ",$4;printf "As Percentage : %.2f%%\n",$4/$2*100;printf "Used Memory : %s  ",$3;printf "As Percentage : %.2f%%\n",$3/$2*100}'

echo -e "\n\nTop 5 Processes by CPU :"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e "\n\nTop 5 Processes by Memory :"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo -e "\nOS specs:"
cat /etc/os-release | grep -i pretty_name

echo -e "\nUptime:"
uptime -p
