#!/bin/bash
# ========================================
# Stop All Servers Script
# ========================================

echo "Stopping L2 Servers..."

# Find and kill Java processes related to L2 servers
pkill -f "com.l2server.loginserver.LoginServer"
pkill -f "com.l2server.gameserver.GameServer"

echo "Servers stopped."
