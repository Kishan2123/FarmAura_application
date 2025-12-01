#!/bin/bash

# FarmAura Mobile App Startup Script
# ==================================

echo "📱 FarmAura Mobile App Launcher"
echo "================================"
echo ""

# Function to handle errors
handle_error() {
    echo "❌ Error: $1"
    exit 1
}

# Check for Flutter
if ! command -v flutter &> /dev/null; then
    handle_error "Flutter is not installed or not in PATH."
fi

# Check for connected devices
echo "🔍 Checking for connected devices..."
DEVICES=$(flutter devices | grep -v "devices found" | grep -v "•" | grep -v "No issues found" | wc -l)

# Note: 'flutter devices' output varies, checking if a valid device line exists is safer.
# A simple check is to see if we have a mobile device or emulator connected.
# We'll try to launch an emulator if we don't see a running android/ios device.

RUNNING_DEVICE=$(flutter devices | grep -E "android|ios" | grep -v "emulator" | wc -l)
RUNNING_EMULATOR=$(flutter devices | grep "emulator" | wc -l)

if [ $RUNNING_DEVICE -eq 0 ] && [ $RUNNING_EMULATOR -eq 0 ]; then
    echo "⚠️  No active mobile devices found."
    echo "🚀 Launching emulator 'Pixel_9_Pro'..."
    
    flutter emulators --launch Pixel_9_Pro || handle_error "Failed to launch emulator."
    
    echo "⏳ Waiting for emulator to boot..."
    # Wait loop could be added here, but flutter run usually waits for device
else
    echo "✅ Found active device/emulator."
fi

echo ""
echo "🚀 Starting FarmAura App..."
echo "================================"

# Run the app
# Using -d to specify emulator if we just launched it, or let flutter pick the first one
flutter run

# If flutter run fails
if [ $? -ne 0 ]; then
    echo ""
    echo "❌ App failed to start."
    echo "Tip: Try running 'flutter doctor' to diagnose issues."
    exit 1
fi
