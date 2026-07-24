#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
MEM=$(free | grep Mem | awk '{print int($3/$2*100)}')
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

SCORE=100

[ "$CPU" -gt 80 ] && SCORE=$((SCORE-20))
[ "$MEM" -gt 80 ] && SCORE=$((SCORE-20))
[ "$DISK" -gt 80 ] && SCORE=$((SCORE-20))

echo ""
echo "===== HEALTH SCORE ====="
echo "Server Health Score: $SCORE / 100"
``
