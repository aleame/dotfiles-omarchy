#!/bin/bash

# Get clean radeontop output
output=$(timeout 0.5 radeontop -d - 2>&1 | tail -1 2>/dev/null)

# Parse GPU usage (looking for "gpu X.XX%")
gpu_usage=$(echo "$output" | awk -F ',' '{for(i=1;i<=NF;i++) if($i ~ /gpu/) {split($i, a, " "); print a[2]; exit}}' | tr -d '%')
gpu_usage=${gpu_usage%.*}  # Convert to integer

# Validate GPU usage
if ! [[ "$gpu_usage" =~ ^[0-9]+$ ]] || [ "$gpu_usage" -gt 100 ]; then
    gpu_usage=0
fi

# Get temperature
gpu_temp="--"
if command -v sensors &> /dev/null; then
    temp=$(sensors | grep -i "edge" | head -1 | grep -o '[0-9][0-9]' | head -1)
    [ -n "$temp" ] && gpu_temp=$temp
fi

if [ "$gpu_temp" = "--" ] || ! [[ "$gpu_temp" =~ ^[0-9]+$ ]]; then
    gpu_temp=55
fi

# Determine temperature class
temp_class="normal"
if [ "$gpu_temp" -ge 70 ] && [ "$gpu_temp" -lt 85 ]; then
    temp_class="warning"
elif [ "$gpu_temp" -ge 85 ]; then
    temp_class="critical"
fi

echo "{\"text\": \"GPU${gpu_usage}%${gpu_temp}°C\", \"tooltip\": \"AMD RX 6700 XT\\nUsage: ${gpu_usage}%\\nTemperature: ${gpu_temp}°C\", \"class\": \"$temp_class\"}"