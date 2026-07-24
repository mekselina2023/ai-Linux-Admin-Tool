#!/bin/bash

echo ""
echo "===== SECURITY AUDIT ====="

FAILED=$(grep "Failed password" /var/log/auth.log 2>/dev/null | wc -l)

echo "Failed SSH Logins: $FAILED"
``
