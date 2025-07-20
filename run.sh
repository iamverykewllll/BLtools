#!/bin/bash

# Define a clean Wine prefix inside this repo
WINEPREFIX="$PWD/wineprefix"

# Check if Wine is installed
if ! command -v wine &> /dev/null; then
    echo "[!] Wine is not installed. Please install it with: sudo apt install wine"
    exit 1
fi

# Create the Wine prefix if it doesn't exist
if [ ! -d "$WINEPREFIX" ]; then
    echo "[*] Creating clean Wine environment..."
    WINEARCH=win64 WINEPREFIX="$WINEPREFIX" wineboot
fi

# Run the EXE
echo "[*] Launching BLtools..."
WINEPREFIX="$WINEPREFIX" wine "$PWD/BLtools.exe"
