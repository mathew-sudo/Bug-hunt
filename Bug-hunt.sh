#!/bin/bash

# Title: Bug-Hunt
# Description: Script to install various bug-hunting tools on mobile phones/Termux

# Exit immediately if a command exits with a non-zero status
set -e

# Constants
GITHUB_BASE_URL="https://github.com"

# Update and upgrade Termux packages
echo "Updating and upgrading Termux packages..."
pkg update -y && pkg upgrade -y

# Install necessary tools
echo "Installing necessary tools..."
pkg install -y git curl wget python python2 ruby rust golang erlang nethunter metasploit-ng

# Function to clone and install tools
install_tool() {
    local tool_name=$1
    echo "Installing tool: $tool_name"
    git clone "${GITHUB_BASE_URL}/${tool_name}.git"
    cd "${tool_name}" || exit
    chmod +x install.sh
    ./install.sh
    cd ..
}

# Install specific tools
echo "Installing TheFatRat..."
install_tool "Screetsec/TheFatRat"

echo "Installing Kraken..."
install_tool "jasonxtn/kraken"
pip3 install -r requirements.txt

# Install Bruteforce tools
echo "Installing bruteforce tools..."
pkg install -y hydra ncrack

# Build APK for Bug-Hunt
echo "Building APK for Bug-Hunt..."
mkdir -p /data/data/com.termux/files/home/Bug-Hunt
cd /data/data/com.termux/files/home/Bug-Hunt || exit
TMPDIR=/var/tmp ./build.sh package build --only=virtualmachine-iso ./package/templates/Android_v7.apk

# Display configuration setup
setup_display() {
    echo "Configuring display settings..."
    cat <<EOL > display_config.txt
[Display]
overlay_background_color = #00ff234fff
title_name = Bug-Hunt
title_color = #000fff557
border_style = solid
border_color = Blue
font = opendyslexic
font_color = dark green
background_color = Black
EOL
}

setup_display

# Install Metasploit
echo "Installing Metasploit..."
pkg install -y metasploit-ng

# Install additional tools
echo "Installing additional tools..."
install_tool "hunt-all"
install_tool "hunt-apk"
install_tool "hunt-filemapper-ng"
install_tool "hunt-endpoint_tracer-ng"
install_tool "hunt-nettapper-ng"
install_tool "hunt-loghunter-ng"

echo "Installation completed!"
