@echo off
title Classical Cryptography Toolkit Setup
echo ==============================================
echo Classical Cryptography Toolkit - Flutter Setup
echo ==============================================
echo.

where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter was not found in PATH.
  echo Install Flutter and add its bin folder to PATH first.
  pause
  exit /b 1
)

if not exist pubspec.yaml (
  echo pubspec.yaml is missing.
  pause
  exit /b 1
)

if not exist lib\main.dart (
  echo lib\main.dart is missing.
  pause
  exit /b 1
)

echo Creating Flutter Android/platform files...
flutter create .

if errorlevel 1 (
  echo Flutter project creation failed.
  pause
  exit /b 1
)

echo Restoring project dependency configuration...
copy /Y pubspec.yaml.template pubspec.yaml >nul

echo Getting packages...
flutter pub get

if errorlevel 1 (
  echo flutter pub get failed.
  pause
  exit /b 1
)

echo.
echo Setup completed.
echo.
echo Now start your Android emulator in Android Studio.
echo Then run:
echo     flutter devices
echo     flutter run
echo.
pause
