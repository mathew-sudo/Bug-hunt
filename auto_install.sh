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

# Run the main script with auto-install option
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
echo -e "${BLUE}[*] You can now run 
