#!/bin/bash

# Run the full installation process automatically
echo -e "\n\033[1;33m[*] Starting automated Termux Security Toolkit installation...\033[0m"
echo -e "\033[32m[✓] Automatically selecting option 6 (Full installation)\033[0m"

# Source the main script but execute option 6 directly
source ./termux_security_toolkit.sh

# Skip the main menu and execute the full installation
echo -e "\n\033[1;33m[*] Starting full installation...\033[0m"
install_basic_packages
install_programming_languages
install_security_tools
install_advanced_security_tools
configure_terminal
cleanup
create_help_guide
echo -e "\n\033[1;32m[✓] Full installation completed successfully!\033[0m"
echo -e "\n\033[1;32m[✓] Thank you for using Termux Security Toolkit!\033[0m"
echo -e "\033[1;33m[!] Some changes may require restarting Termux to take effect.\033[0m"
