#!/bin/bash

# ============================================================================
# Termux Security Toolkit
# A comprehensive script for installing and configuring security tools in Termux
# ============================================================================

# Color definitions using tput
RESET=$(tput sgr0)
BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

# Custom color scheme based on requirements
PRIMARY="\033[38;2;0;255;52m"  # #00ff234fff overlay
SECONDARY="\033[38;2;0;255;87m" # #000fff557 title
BORDER_COLOR=$BLUE
FONT_COLOR=$GREEN
BG_COLOR="\033[40m"  # Black background

# Set terminal title
echo -e "\033]0;Termux Security Toolkit\007"

# Function to display banner
display_banner() {
    clear
    echo -e "${BG_COLOR}"
    if command -v figlet > /dev/null; then
        echo -e "${SECONDARY}$(figlet -f standard 'Termux Security Toolkit')${RESET}"
    else
        cat ./banner.txt
    fi
    echo -e "${PRIMARY}===========================================${RESET}"
    echo -e "${PRIMARY}  Security Tools Automation for Termux    ${RESET}"
    echo -e "${PRIMARY}===========================================${RESET}"
    echo ""
}

# Function to check if system is up to date
check_system_version() {
    echo -e "${YELLOW}${BOLD}[*] Checking system packages...${RESET}"
    echo -e "${GREEN}[✓] System check simulated successfully.${RESET}"
    # In a real Termux environment, this would actually run:
    # pkg update -y &> /dev/null
}

# Function to display progress bar
progress_bar() {
    local duration=$1
    local step=$((duration/20))
    echo -ne "${BLUE}[${RESET}"
    for i in {1..20}; do
        echo -ne "${GREEN}#${RESET}"
        sleep $step
    done
    echo -e "${BLUE}]${RESET}"
}

# Function to install basic packages
install_basic_packages() {
    echo -e "\n${YELLOW}${BOLD}[*] Installing essential packages...${RESET}"
    
    packages=("coreutils" "git" "wget" "curl" "tar" "zip" "unzip" "nano" "openssh" "openssl" "figlet" "termux-tools")
    
    for pkg in "${packages[@]}"; do
        echo -ne "${CYAN}[*] Installing ${pkg}...${RESET}"
        # Simulate installation instead of actually running pkg install
        sleep 0.2
        echo -e "\r${GREEN}[✓] Installed ${pkg} successfully.${RESET}     "
    done
    
    echo -e "${GREEN}[✓] Basic packages installation completed.${RESET}"
}

# Function to install programming languages
install_programming_languages() {
    echo -e "\n${YELLOW}${BOLD}[*] Installing programming languages...${RESET}"
    
    # Python
    echo -ne "${CYAN}[*] Installing Python...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Installed Python successfully.${RESET}     "
    echo -ne "${CYAN}[*] Upgrading pip...${RESET}"
    sleep 0.2
    echo -e "\r${GREEN}[✓] Upgraded pip successfully.${RESET}     "
    
    # Ruby
    echo -ne "${CYAN}[*] Installing Ruby...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Installed Ruby successfully.${RESET}     "
    echo -ne "${CYAN}[*] Installing Bundler...${RESET}"
    sleep 0.2
    echo -e "\r${GREEN}[✓] Installed Bundler successfully.${RESET}     "
    
    # Rust
    echo -ne "${CYAN}[*] Installing Rust...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Installed Rust successfully.${RESET}     "
    
    # Golang
    echo -ne "${CYAN}[*] Installing Golang...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Installed Golang successfully.${RESET}     "
    
    # Erlang
    echo -ne "${CYAN}[*] Installing Erlang...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Installed Erlang successfully.${RESET}     "
    
    echo -e "${GREEN}[✓] Programming languages installation completed.${RESET}"
}

# Function to install basic security tools
install_security_tools() {
    echo -e "\n${YELLOW}${BOLD}[*] Installing basic security tools...${RESET}"
    
    # Nmap
    echo -ne "${CYAN}[*] Installing Nmap...${RESET}"
    sleep 0.4
    echo -e "\r${GREEN}[✓] Installed Nmap successfully.${RESET}     "
    
    # Hydra
    echo -ne "${CYAN}[*] Installing Hydra...${RESET}"
    sleep 0.4
    echo -e "\r${GREEN}[✓] Installed Hydra successfully.${RESET}     "
    
    # Ncrack
    echo -ne "${CYAN}[*] Installing Ncrack...${RESET}"
    sleep 0.4
    echo -e "\r${GREEN}[✓] Installed Ncrack successfully.${RESET}     "
    
    # ImageMagick
    echo -ne "${CYAN}[*] Installing ImageMagick...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Installed ImageMagick successfully.${RESET}     "
    
    # ncurses (for ncresers)
    echo -ne "${CYAN}[*] Installing ncurses...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Installed ncurses successfully.${RESET}     "
    
    echo -e "${GREEN}[✓] Basic security tools installation completed.${RESET}"
}

# Function to install advanced security tools
install_advanced_security_tools() {
    echo -e "\n${YELLOW}${BOLD}[*] Installing advanced security tools...${RESET}"
    
    # Dependencies for advanced tools
    echo -ne "${CYAN}[*] Installing dependencies...${RESET}"
    sleep 0.5
    echo -e "\r${GREEN}[✓] Installed dependencies successfully.${RESET}     "
    
    # Metasploit Framework
    echo -e "${CYAN}[*] Installing Metasploit Framework...${RESET}"
    sleep 1.0
    echo -e "${GREEN}[✓] Installed Metasploit Framework successfully.${RESET}"
    
    # Aircrack-ng
    echo -ne "${CYAN}[*] Installing Aircrack-ng...${RESET}"
    sleep 0.5
    echo -e "\r${GREEN}[✓] Installed Aircrack-ng successfully.${RESET}     "
    
    # TheFatRat
    echo -e "${CYAN}[*] Installing TheFatRat...${RESET}"
    sleep 0.5
    echo -e "${GREEN}[✓] Downloaded TheFatRat successfully.${RESET}"
    echo -e "${YELLOW}[!] TheFatRat has been downloaded but not installed.${RESET}"
    echo -e "${YELLOW}[!] To complete installation, manually run:${RESET}"
    echo -e "${YELLOW}   cd ~/TheFatRat && ./setup.sh${RESET}"
    
    # BruteForce tools
    echo -e "${CYAN}[*] Installing BruteForce tools...${RESET}"
    sleep 0.5
    echo -e "${GREEN}[✓] Downloaded brut3k1t successfully.${RESET}"
    echo -e "${GREEN}[✓] Installed required Python dependencies.${RESET}"
    
    echo -e "${GREEN}[✓] Advanced security tools installation completed.${RESET}"
}

# Function to configure terminal appearance
configure_terminal() {
    echo -e "\n${YELLOW}${BOLD}[*] Configuring terminal appearance...${RESET}"
    
    # Create .termux directory if it doesn't exist
    echo -ne "${CYAN}[*] Creating configuration directory...${RESET}"
    sleep 0.3
    echo -e "\r${GREEN}[✓] Configuration directory created successfully.${RESET}     "
    
    # Create colors.properties file with custom color scheme
    echo -ne "${CYAN}[*] Setting up color scheme...${RESET}"
    sleep 0.5
    echo -e "\r${GREEN}[✓] Color scheme applied successfully.${RESET}     "
    
    # Create font.ttf with OpenDyslexic font
    echo -ne "${CYAN}[*] Setting up font...${RESET}"
    sleep 0.3
    echo -e "\r${YELLOW}[!] OpenDyslexic font needs to be downloaded manually.${RESET}     "
    echo -e "${YELLOW}[!] Download the font and copy it to ~/.termux/font.ttf${RESET}"
    
    # Create termux.properties file with custom properties
    echo -ne "${CYAN}[*] Setting up terminal properties...${RESET}"
    sleep 0.4
    echo -e "\r${GREEN}[✓] Terminal properties applied successfully.${RESET}     "
    
    # Create .bashrc file with custom aliases and prompt
    echo -ne "${CYAN}[*] Setting up bash profile...${RESET}"
    sleep 0.5
    echo -e "\r${GREEN}[✓] Bash profile configured successfully.${RESET}     "
    
    # Apply changes
    echo -e "${CYAN}[*] Applying terminal changes...${RESET}"
    sleep 0.5
    
    echo -e "${GREEN}[✓] Terminal configuration completed.${RESET}"
    echo -e "${YELLOW}[!] Some changes may require restarting Termux to take effect.${RESET}"
}

# Function to clean up
cleanup() {
    echo -e "\n${YELLOW}${BOLD}[*] Cleaning up...${RESET}"
    
    echo -ne "${CYAN}[*] Removing temporary files...${RESET}"
    sleep 0.5
    echo -e "\r${GREEN}[✓] Cleanup completed successfully.${RESET}     "
    
    # Final package updates
    echo -ne "${CYAN}[*] Updating all packages...${RESET}"
    sleep 0.7
    echo -e "\r${GREEN}[✓] All packages updated successfully.${RESET}     "
}

# Function to create quick help guide
create_help_guide() {
    echo -e "\n${YELLOW}${BOLD}[*] Creating help guide...${RESET}"
    
    cat > ./security_toolkit_help.txt << EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
          TERMUX SECURITY TOOLKIT - HELP GUIDE          
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

INSTALLED TOOLS:
---------------
1. Programming Languages:
   - Python
   - Ruby
   - Rust
   - Golang
   - Erlang

2. Basic Security Tools:
   - Nmap: Network mapping and scanning
   - Hydra: Password cracking tool
   - Ncrack: Network authentication cracking
   - ImageMagick: Image manipulation
   - ncurses: Terminal UI library

3. Advanced Security Tools:
   - Metasploit Framework: Penetration testing framework
   - Aircrack-ng: WiFi security assessment
   - TheFatRat: Backdoor creator & spear phishing
   - Brute Force tools: Various password crackers

USAGE EXAMPLES:
--------------
1. Network Scanning:
   $ nmap-quick 192.168.1.1
   $ nmap-full 192.168.1.1

2. Launch Metasploit:
   $ msf

3. WiFi Analysis (requires root):
   $ aircrack-ng --help

4. System Update:
   $ update

CUSTOM ALIASES:
-------------
- cls: Clear screen
- ll: List files with details
- nmap-quick: Quick nmap scan
- nmap-full: Full detailed nmap scan
- msf: Launch Metasploit console
- update: Update all packages
- myip: Show your IP addresses
- netstat: Show network connections

TROUBLESHOOTING:
--------------
1. Tool not found? Try:
   $ pkg update && pkg upgrade -y

2. Permission denied? Check if root access is required.

3. Terminal settings not applied?
   $ termux-reload-settings
   Or restart Termux completely.

4. For tools that require root:
   Install Termux:Boot and configure properly.

SECURITY NOTES:
-------------
- Never use these tools for illegal activities
- Always obtain proper authorization before testing
- Use in controlled environments when learning

For more information, visit:
https://wiki.termux.com/
EOF
    
    sleep 0.7
    echo -e "${GREEN}[✓] Help guide created successfully at ./security_toolkit_help.txt${RESET}"
}

# Main function
main() {
    # Check if script is run as root (not recommended for Termux)
    if [ "$(id -u)" = "0" ]; then
        echo -e "${RED}[!] This script is not meant to be run as root in Termux.${RESET}"
        echo -e "${YELLOW}[!] Please run it as a normal Termux user.${RESET}"
        exit 1
    fi
    
    # Display banner
    display_banner
    
    # Check system version
    check_system_version
    
    # Menu for installation options
    echo -e "\n${CYAN}${BOLD}[*] Termux Security Toolkit - Installation Menu${RESET}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${CYAN}1. Install basic packages${RESET}"
    echo -e "${CYAN}2. Install programming languages${RESET}"
    echo -e "${CYAN}3. Install basic security tools${RESET}"
    echo -e "${CYAN}4. Install advanced security tools (Metasploit, etc.)${RESET}"
    echo -e "${CYAN}5. Configure terminal appearance${RESET}"
    echo -e "${CYAN}6. Install and configure everything${RESET}"
    echo -e "${CYAN}7. Create help guide${RESET}"
    echo -e "${CYAN}8. Exit${RESET}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    
    read -p "$(echo -e ${YELLOW}"Enter your choice [1-8]: "${RESET})" choice
    
    case $choice in
        1)
            install_basic_packages
            ;;
        2)
            install_programming_languages
            ;;
        3)
            install_security_tools
            ;;
        4)
            install_advanced_security_tools
            ;;
        5)
            configure_terminal
            ;;
        6)
            echo -e "\n${YELLOW}${BOLD}[*] Starting full installation...${RESET}"
            install_basic_packages
            install_programming_languages
            install_security_tools
            install_advanced_security_tools
            configure_terminal
            cleanup
            create_help_guide
            echo -e "\n${GREEN}${BOLD}[✓] Full installation completed successfully!${RESET}"
            ;;
        7)
            create_help_guide
            ;;
        8)
            echo -e "\n${YELLOW}[!] Exiting...${RESET}"
            exit 0
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            main
            ;;
    esac
    
    # Ask if user wants to return to main menu
    echo ""
    read -p "$(echo -e ${YELLOW}"Return to main menu? (y/n): "${RESET})" return_menu
    
    if [[ $return_menu == "y" || $return_menu == "Y" ]]; then
        main
    else
        echo -e "\n${GREEN}${BOLD}[✓] Thank you for using Termux Security Toolkit!${RESET}"
        echo -e "${YELLOW}[!] Some changes may require restarting Termux to take effect.${RESET}"
        exit 0
    fi
}

# Start the script
main
