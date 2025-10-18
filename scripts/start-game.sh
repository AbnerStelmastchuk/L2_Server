#!/bin/bash
# ========================================
# Start Game Server Script
# ========================================

echo "Starting L2 Game Server..."

# Set Java options - adjust based on your server needs
JAVA_OPTS="-Xms1024m -Xmx2048m -XX:+UseG1GC -XX:+AggressiveOpts"

# Change to the project directory
cd "$(dirname "$0")/.."

# Check if compiled
if [ ! -d "target" ] && [ ! -d "build" ]; then
    echo "Error: Server not compiled. Please run 'mvn clean install' or 'gradle build' first."
    exit 1
fi

# Start the game server
# Adjust the jar file name and path according to your build output
java $JAVA_OPTS -cp "libs/*:target/*" com.l2server.gameserver.GameServer

# Or for Gradle:
# java $JAVA_OPTS -cp "libs/*:build/libs/*" com.l2server.gameserver.GameServer
