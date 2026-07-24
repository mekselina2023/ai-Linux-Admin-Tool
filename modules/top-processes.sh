#!/bin/bash

echo ""
echo "===== TOP PROCESSES ====="

ps aux --sort=-%cpu | head -5
