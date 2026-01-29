#!/bin/bash
# RAM Temperature Monitor

# Get RAM temperature from sensors
ram_temp_raw=$(sensors | grep -i "mem:" | head -1)

if [ -z "$ram_temp_raw" ]; then
    echo "{\"text\": \"\", \"class\": \"disabled\"}"  # Empty if no sensor
    exit 0
fi

# Extract temperature (e.g., +58.0°C -> 58)
ram_temp=$(echo "$ram_temp_raw" | grep -o '[+-][0-9]*\.[0-9]*°C' | head -1 | tr -d '+°C' | cut -d'.' -f1)

# Also get RAM usage
ram_usage=$(free | grep Mem | awk '{print int($3/$2 * 100)}')

# Get critical temp from sensor output
ram_crit=$(echo "$ram_temp_raw" | grep -o 'crit = [+-][0-9]*\.[0-9]*°C' | head -1 | grep -o '[0-9]*\.[0-9]*' | cut -d'.' -f1)
ram_crit=${ram_crit:-95}  # Default if not found

# Determine status (RAM tolerates higher temps)
status_class="normal"
if [ "$ram_temp" -ge 70 ] && [ "$ram_temp" -lt 85 ]; then
    status_class="warning"
elif [ "$ram_temp" -ge 85 ]; then
    status_class="critical"
fi

echo "{\"text\": \"RAM${ram_usage}%${ram_temp}°C\", \"tooltip\": \"Memory: ${ram_usage}%\\nTemperature: ${ram_temp}°C\", \"class\": \"$status_class\"}"