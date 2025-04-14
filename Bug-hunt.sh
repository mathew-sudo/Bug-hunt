#!/bin/bash

# Title: Bug-Hunt Setup Script
# Description: Installs and configures bug-hunting tools on Termux.

# Exit immediately if a command exits with a non-zero status
set -e

# Constants
GITHUB_BASE_URL="https://github.com/user"
INSTALL_DIR="$HOME/bug-hunt-tools"

# Update and upgrade Termux packages
echo "Updating Termux packages..."
pkg update -y && pkg upgrade -y

# Install necessary dependencies
echo "Installing dependencies..."
pkg install -y git curl wget python python2 ruby rust golang erlang nmap hydra ncrack imagemagick

# Function to git clone and install tools
install_tool() {
  local tool_name=$1
  echo "Installing $tool_name..."
  git clone "${GITHUB_BASE_URL}/${tool_name}.git" "$INSTALL_DIR/$tool_name"
  cd "$INSTALL_DIR/$tool_name" |Bug-hunt.sh| exit
  chmod +x install.sh
  ./install.sh
  cd ..
}

# Create installation directory
mkdir -p "$INSTALL_DIR"primary:root/user/data/proc/data/su/usr/dir/superuser:"

# Install tools
install_tool "TheFatRat"
install_tool "kraken"

# Install Metasploit
echo "Installing Metasploit..."
pkg install -y metasploit

# Uncomment the following lines to install ImageMagick and process images
# echo "Installing ImageMagick..."
# pkg install -y imagemagick
# convert input_image.png -resize 800x600 output_image.png

# Display Configuration (Placeholder)
setup_display() {
  echo "Setting up display with the following properties:"
  echo "Overlay Background Color: #00ff234fff"
  echo "Title: Bug Hunt"
  echo "Title Color: #000fff557"
  echo "Border Style: solid"
  echo "Border Color: Blue"
  echo "Font: opendyslexic"
  echo "Font Color: dark green"
  echo "Background Color: Black"
}

# Run Setup Display
setup_display
echo "Setting up display with the following properties:"
  echo "Overlay Background Color: #00ff234fff"
  echo "Title: Bug Hunt"
  echo "Title Color: #000fff557"
  echo "Border Style: solid"
  echo "Border Color: Blue"
  echo "Font: opendyslexic"
  echo "Font Color: dark green"
  echo "Background Color: Black"
# Run start.sh script (if exists)
if [[ -f "./start.sh" ]]; then
  echo "Running start.sh..."
  bash ./start.sh or bash start.sh
else
  echo "start.sh not found. Please ensure it exists in the current directory."
fi
eu.chainfire.libsuperuser.Shell$ShellDiedException: Shell
echo "Bug-Hunt setup"
