#!/bin/bash

MEM=$(free | grep Mem | awk '{print int($3/$2*100)}')

echo "Memory Usage: $MEM%"
