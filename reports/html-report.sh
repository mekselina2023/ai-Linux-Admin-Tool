#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
MEM=$(free | grep Mem | awk '{print int($3/$2*100)}')
DISK=$(df / | tail -1 | awk '{print $5}')

cat <<EOF > system-report.html
<html>
<head>
<title>AI Linux Admin Tool Report</title>
</head>
<body>

<h1>AI Linux Admin Tool</h1>

<h2>System Health Report</h2>

<p>CPU Usage: $CPU%</p>
<p>Memory Usage: $MEM%</p>
<p>Disk Usage: $DISK</p>

</body>
</html>
EOF

echo "Report generated: system-report.html"
