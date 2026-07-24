#!/bin/bash

echo "================================="
echo " Zabbix Problem Fetcher"
echo "================================="

# ZABBIX API SETTINGS

ZABBIX_URL="https://your-zabbix-server/api_jsonrpc.php"
USERNAME="Admin"
PASSWORD="zabbix"

# LOGIN

AUTH=$(curl -s -X POST $ZABBIX_URL \
-H "Content-Type: application/json-rpc" \
-d "{
\"jsonrpc\":\"2.0\",
\"method\":\"user.login\",
\"params\":{
\"username\":\"$USERNAME\",
\"password\":\"$PASSWORD\"
},
\"id\":1
}" | jq -r '.result')

echo ""
echo "Authentication successful"
echo ""

# GET PROBLEMS

curl -s -X POST $ZABBIX_URL \
-H "Content-Type: application/json-rpc" \
-d "{
\"jsonrpc\":\"2.0\",
\"method\":\"problem.get\",
\"params\":{
\"output\":\"extend\",
\"recent\":true,
\"sortfield\":\"eventid\",
\"sortorder\":\"DESC\"
},
\"auth\":\"$AUTH\",
\"id\":2
}" | jq .
