@echo off
REM ============================================================
REM  Tolkuchka - local APK build helper (Windows)
REM  Requires: Android Studio OR Android SDK + JDK 17 installed.
REM  If Android Studio is installed, run from its bundled terminal.
REM ============================================================
cd /d "%~dp0"

echo [1/2] Generating Gradle wrapper (if missing)...
where gradlew >nul 2>nul
if errorlevel 1 (
    where gradle >nul 2>nul
    if errorlevel 1 (
        echo ERROR: Gradle not found. Open this folder in Android Studio instead.
        pause
        exit /b 1
    )
    gradle wrapper --gradle-version 8.2 --distribution-type bin
)

echo [2/2] Building debug APK...
call gradlew.bat assembleDebug --no-daemon

echo.
echo DONE. Your APK is here:
echo   app\build\outputs\apk\debug\app-debug.apk
pause
