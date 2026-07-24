#!/bin/bash

DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo ""
echo "===== AI ANALYSIS ====="

if [ "$DISK" -gt 90 ]; then
    echo "CRITICAL: Disk usage is above 90%"
    echo "Possible Causes:"
    echo "- Log growth"
    echo "- Docker images"
    echo "- Backup files"
    echo ""
    echo "Recommended Commands:"
    echo "du -sh /*"
    echo "journalctl --disk-usage"
    echo "docker system df"
else
    echo "Disk health is normal."
fi
