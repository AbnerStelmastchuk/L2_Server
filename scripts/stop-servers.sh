#!/bin/bash
# ========================================
# Stop All Servers Script
# ========================================

echo "Stopping L2 Servers..."

# Find and kill Java processes related to L2 servers using exact pattern matching
# This ensures only the specific L2 server processes are terminated
pkill -f "com\.l2server\.loginserver\.LoginServer"
pkill -f "com\.l2server\.gameserver\.GameServer"

# Alternative method using PID files (uncomment if you create PID files in start scripts):
# if [ -f "loginserver.pid" ]; then
#     kill $(cat loginserver.pid)
#     rm loginserver.pid
# fi
# if [ -f "gameserver.pid" ]; then
#     kill $(cat gameserver.pid)
#     rm gameserver.pid
# fi

echo "Servers stopped."
