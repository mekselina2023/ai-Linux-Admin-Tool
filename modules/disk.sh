#!/bin/bash

DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Disk Usage: $DISK%"
