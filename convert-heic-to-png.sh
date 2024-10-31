#!/bin/bash
#
# Nautilus script to convert selected HEIC images to PNG format
# 
# Requirements:
# Ensure `heif-gdk-pixbuf` package is installed:
#   sudo apt install heif-gdk-pixbuf
#
# This script processes each file selected in Nautilus and converts
# files with a .heic or .HEIC extension to .png format, preserving the original file name.
# 
# Usage:
# 1. Place this script in `~/.local/share/nautilus/scripts/`.
# 2. Make it executable with: chmod +x script_name.sh
# 3. Right-click on selected HEIC files in Nautilus, and run the script from the "Scripts" menu.
#

for file in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
    # Check if the file has a .heic or .HEIC extension (case insensitive)
    if [[ "$file" =~ \.[hH][eE][iI][cC]$ ]]; then
        # Convert the HEIC file to PNG format
        heif-convert "$file" "${file%.*}.png"
    fi
done
