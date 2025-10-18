@echo off
REM ========================================
REM Start Game Server Script (Windows)
REM ========================================

echo Starting L2 Game Server...

REM Set Java options - adjust based on your server needs
set JAVA_OPTS=-Xms1024m -Xmx2048m -XX:+UseG1GC -XX:+AggressiveOpts

REM Change to the project directory
cd /d "%~dp0\.."

REM Check if compiled
if not exist "target\" if not exist "build\" (
    echo Error: Server not compiled. Please run 'mvn clean install' or 'gradle build' first.
    pause
    exit /b 1
)

REM Start the game server
REM Adjust the jar file name and path according to your build output
java %JAVA_OPTS% -cp "libs/*;target/*" com.l2server.gameserver.GameServer

REM Or for Gradle:
REM java %JAVA_OPTS% -cp "libs/*;build/libs/*" com.l2server.gameserver.GameServer

pause
