#!/bin/bash
# ========================================
# Start Login Server Script
# ========================================

echo "Starting L2 Login Server..."

# Set Java options
JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC"

# Change to the project directory
cd "$(dirname "$0")/.."

# Check if compiled
if [ ! -d "target" ] && [ ! -d "build" ]; then
    echo "Error: Server not compiled. Please run 'mvn clean install' or 'gradle build' first."
    exit 1
fi

# Start the login server
# Adjust the jar file name and path according to your build output
java $JAVA_OPTS -cp "libs/*:target/*" com.l2server.loginserver.LoginServer

# Or for Gradle:
# java $JAVA_OPTS -cp "libs/*:build/libs/*" com.l2server.loginserver.LoginServer
