#!/bin/bash

# ========================================================================
# Termux Security Toolkit - Auto Installation Script
# This script automates the "install everything" option without requiring
# user interaction
# ========================================================================

# Define color codes for better readability
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Display banner
if [ -f "banner.txt" ]; then
    cat banner.txt
else
    echo -e "${BLUE}=========================================${RESET}"
    echo -e "${BLUE}     TERMUX SECURITY TOOLKIT${RESET}"
    echo -e "${BLUE}=========================================${RESET}"
fi
echo -e "==========================================="
echo -e "  Security Tools Automation for Termux    "
echo -e "==========================================="
echo -e "${GREEN}[*] Running in No-Auth Mode - Authentication prompts will be bypassed${RESET}"

# Check if main script exists
if [ ! -f "./termux_security_toolkit.sh" ]; then
    echo -e "${RED}[✗] Error: Main toolkit script not found!${RESET}"
    echo -e "${YELLOW}[!] Please make sure 'termux_security_toolkit.sh' is in the current directory.${RESET}"
    exit 1
fi

# Make the main script executable if needed
if [ ! -x "./termux_security_toolkit.sh" ]; then
    echo -e "${YELLOW}[!] Making the main script executable...${RESET}"
    chmod +x ./termux_security_toolkit.sh
fi

# Install core packages and dependencies
install_core_packages() {
    echo -e "${YELLOW}[*] Installing core packages and dependencies...${RESET}"
    PKG_MANAGER="pkg"
    if ! command -v pkg &>/dev/null; then
        PKG_MANAGER="apt"
    fi
    $PKG_MANAGER update -y && $PKG_MANAGER upgrade -y
    $PKG_MANAGER install -y git wget curl python ruby tsu sudo nmap hydra aircrack-ng metasploit hashcat john sqlmap nikto
    # Install pip and python modules
    if command -v pip &>/dev/null; then
        pip install --upgrade pip
        pip install brut3k1t
    fi
    # Install Ruby gems
    for gem in wpscan evil-winrm metasploit-framework snmp; do
        if ! gem list | grep -q $gem; then
            gem install $gem --no-document
        fi
    done
    # Install searchsploit (exploitdb)
    if ! command -v searchsploit &>/dev/null; then
        git clone https://github.com/offensive-security/exploitdb.git ~/exploitdb
        ln -s ~/exploitdb/searchsploit /usr/local/bin/searchsploit 2>/dev/null || true
    fi
    echo -e "${GREEN}[✓] Core packages and dependencies installed.${RESET}"
}

# Attempt to get root if not already
bypass_or_get_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${YELLOW}[!] Not running as root. Attempting to escalate privileges...${RESET}"
        if command -v tsu &>/dev/null; then
            tsu || echo -e "${RED}[!] tsu failed. Continuing without root.${RESET}"
        elif command -v sudo &>/dev/null; then
            sudo -v || echo -e "${RED}[!] sudo failed. Continuing without root.${RESET}"
        else
            echo -e "${RED}[!] No root escalation tool found. Some tools may not work fully.${RESET}"
        fi
    else
        echo -e "${GREEN}[✓] Already running as root.${RESET}"
    fi
}

# Run the main script with auto-install option
install_core_packages
bypass_or_get_root

echo -e "${GREEN}[✓] Starting automatic installation of all components${RESET}"
echo -e "${YELLOW}[!] This will install all tools and configure your environment${RESET}"
echo -e "${YELLOW}[!] The process may take several minutes. Please be patient.${RESET}"
echo

# Check if simulation mode is requested
if [ "$1" = "--simulate" ] || [ "$1" = "-s" ]; then
    echo -e "${YELLOW}[!] Running in simulation mode. No actual installation will be performed.${RESET}"
    ./termux_security_toolkit.sh --auto-install --simulate
else
    # Use built-in function for real automatic installation
    ./termux_security_toolkit.sh --auto-install
fi

# Note: The actual automated installation logic is inside the main script.
# The script will detect the --auto-install flag and run all installation functions.

echo -e "${GREEN}[✓] Auto-installation script completed${RESET}"
echo -e "${CYAN}[✓] No-Auth Mode enabled - all authentication prompts will be bypassed${RESET}"
echo -e "${YELLOW}[!] Please restart Termux to apply all changes${RESET}"
echo -e "${BLUE}[*] You can now run the installed tools from the Termux command line.${RESET}"
