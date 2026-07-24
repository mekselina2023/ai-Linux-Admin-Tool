#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

echo ""
echo "===== ROOT CAUSE ANALYSIS ====="

if [ "$CPU" -gt 80 ]; then
    echo "High CPU detected."

    echo ""
    echo "Top Processes:"

    ps aux --sort=-%cpu | head -6
fi
