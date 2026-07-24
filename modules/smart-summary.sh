#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
MEM=$(free | grep Mem | awk '{print int($3/$2*100)}')
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

SCORE=100

[ "$CPU" -gt 80 ] && SCORE=$((SCORE-20))
[ "$MEM" -gt 80 ] && SCORE=$((SCORE-20))
[ "$DISK" -gt 80 ] && SCORE=$((SCORE-20))

echo ""
echo "================================="
echo " AI SMART SUMMARY"
echo "================================="

echo ""
echo "Overall Health Score: $SCORE / 100"

echo ""

if [ "$SCORE" -ge 90 ]; then
    echo "Status: HEALTHY"
    echo "Infrastructure is operating normally."
elif [ "$SCORE" -ge 70 ]; then
    echo "Status: WARNING"
    echo "Potential issues detected."
else
    echo "Status: CRITICAL"
    echo "Immediate investigation recommended."
fi

echo ""
echo "Metrics:"
echo "- CPU Usage: $CPU%"
echo "- Memory Usage: $MEM%"
echo "- Disk Usage: $DISK%"
