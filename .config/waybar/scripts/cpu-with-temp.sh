#!/bin/bash

# Get CPU usage (using top method)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 | awk '{print int($1+0.5)}')

# Try multiple temperature sources
cpu_temp="N/A"
# Try your configured path first
if [ -f "/sys/class/hwmon/hwmon2/temp1_input" ]; then
    cpu_temp=$(cat /sys/class/hwmon/hwmon2/temp1_input)
    cpu_temp=$((cpu_temp / 1000))
elif [ -f "/sys/class/hwmon/hwmon1/temp1_input" ]; then
    cpu_temp=$(cat /sys/class/hwmon/hwmon1/temp1_input)
    cpu_temp=$((cpu_temp / 1000))
elif [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
    cpu_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    cpu_temp=$((cpu_temp / 1000))
fi

# Determine temperature class
temp_class="normal"
if [ "$cpu_temp" -ge 70 ] && [ "$cpu_temp" -lt 85 ]; then
    temp_class="warning"
elif [ "$cpu_temp" -ge 85 ]; then
    temp_class="critical"
fi

# Format output matching your style
echo "{\"text\": \"CPU${cpu_usage}%${cpu_temp}°C\", \"tooltip\": \"AMD Ryzen 5 3600X\\nUsage: ${cpu_usage}%\\nTemperature: ${cpu_temp}°C\", \"class\": \"$temp_class\"}"