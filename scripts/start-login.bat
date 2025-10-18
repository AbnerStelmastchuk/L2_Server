@echo off
REM ========================================
REM Start Login Server Script (Windows)
REM ========================================

echo Starting L2 Login Server...

REM Set Java options
set JAVA_OPTS=-Xms256m -Xmx512m -XX:+UseG1GC

REM Change to the project directory
cd /d "%~dp0\.."

REM Check if compiled
if not exist "target\" if not exist "build\" (
    echo Error: Server not compiled. Please run 'mvn clean install' or 'gradle build' first.
    pause
    exit /b 1
)

REM Start the login server
REM Adjust the jar file name and path according to your build output
java %JAVA_OPTS% -cp "libs/*;target/*" com.l2server.loginserver.LoginServer

REM Or for Gradle:
REM java %JAVA_OPTS% -cp "libs/*;build/libs/*" com.l2server.loginserver.LoginServer

pause
