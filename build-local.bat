@echo off
echo Installing dependencies...
call npm install
if errorlevel 1 exit /b 1

echo Creating Android platform...
call npx cap add android
if errorlevel 1 exit /b 1

echo Syncing web app...
call npx cap sync android
if errorlevel 1 exit /b 1

echo Building debug APK...
cd android
call gradlew.bat assembleDebug
echo.
echo APK should be at:
echo android\app\build\outputs\apk\debug\app-debug.apk
