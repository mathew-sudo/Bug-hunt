#!/bin/bash
set -e

# Define color codes for better readability
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Define environment variables and paths
# Use a single associative array for config
declare -A ENV_CONFIG=(
    ["TERMUX_PATH"]="/data/data/com.termux"
    ["STANDARD_PREFIX"]="/usr"
    ["CONFIG_BASE"]="$HOME/.config"
)

# Improved environment detection function
check_environment() {
    echo -e "${BLUE}[*] Checking system environment...${RESET}"
    # Detect if running in Termux or standard Linux
    if [ -d "${ENV_CONFIG[TERMUX_PATH]}" ]; then
        IS_TERMUX=true
        PKG_MANAGER="pkg"
        TERMUX_PREFIX="${ENV_CONFIG[TERMUX_PATH]}/files/usr"
        CONFIG_DIR="$HOME/.termux"
        echo -e "${GREEN}[✓] Running in Termux environment.${RESET}"
    else
        IS_TERMUX=false
        PKG_MANAGER="apt"
        TERMUX_PREFIX="${ENV_CONFIG[STANDARD_PREFIX]}"
        CONFIG_DIR="${ENV_CONFIG[CONFIG_BASE]}/termux"
        echo -e "${YELLOW}[!] Not running in Termux environment. Using standard Linux paths.${RESET}"
    fi
    # Create configuration directory if it doesn't exist, with error handling
    if ! mkdir -p "$CONFIG_DIR" 2>/dev/null; then
        echo -e "${RED}[!] Failed to create config directory: $CONFIG_DIR${RESET}"
        exit 1
    fi
    chmod 700 "$CONFIG_DIR"
    # System information detection
    local system_info=$(uname -a)
    local os_type=$(uname -o)
    local cpu_arch=$(uname -m)
    local kernel_ver=$(uname -r)
    # Store environment info
    cat > "$CONFIG_DIR/environment.json" << EOF
{
    "system": {
        "os": "$os_type",
        "kernel": "$kernel_ver",
        "architecture": "$cpu_arch",
        "full_info": "$system_info"
    },
    "runtime": {
        "is_termux": $([[ -d "${ENV_CONFIG[TERMUX_PATH]}" ]] && echo "true" || echo "false"),
        "uid": $(id -u),
        "gid": $(id -g),
        "has_root": $([[ $EUID -eq 0 ]] && echo "true" || echo "false")
    }
}
EOF

    # Environment-specific configuration
    if [[ -d "${ENV_CONFIG[TERMUX_PATH]}" ]]; then
        setup_termux_environment
    else
        setup_standard_environment
    fi
    
    # Verify and secure environment
    secure_environment
}

setup_termux_environment() {
    PKG_MANAGER="pkg"
    TERMUX_PREFIX="${ENV_CONFIG[TERMUX_PATH]}/files/usr"
    CONFIG_DIR="$HOME/.termux"
    
    # Create and secure Termux directories
    for dir in "bin" "etc" "tmp" "var/log" "var/run"; do
        mkdir -p "$TERMUX_PREFIX/$dir"
        chmod 700 "$TERMUX_PREFIX/$dir"
    done
    
    # Setup Termux properties
    setup_termux_properties
    
    echo -e "${GREEN}[✓] Termux environment configured successfully${RESET}"
}

setup_termux_properties() {
    local properties_file="$CONFIG_DIR/termux.properties"
    
    # Backup existing properties
    [[ -f "$properties_file" ]] && cp "$properties_file" "${properties_file}.backup"
    
    # Create enhanced properties file
    cat > "$properties_file" << EOF
# Enhanced Security Configuration
allow_external_apps=false
allow_external_scripts=false
enforce_security=true
terminal_margin=0
bell-character=ignore
allow_external_storage=false
extra-keys=[['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
EOF
    
    chmod 600 "$properties_file"
}

setup_standard_environment() {
    PKG_MANAGER="apt"
    TERMUX_PREFIX="${ENV_CONFIG[STANDARD_PREFIX]}"
    CONFIG_DIR="${ENV_CONFIG[CONFIG_BASE]}/termux"
    
    # Create necessary directories
    mkdir -p "$CONFIG_DIR"
    chmod 700 "$CONFIG_DIR"
    
    echo -e "${YELLOW}[!] Standard Linux environment detected${RESET}"
}

secure_environment() {
    # Set secure permissions
    umask 077
    
    # Check for common security issues
    local security_issues=()
    
    # Check world-writable directories
    if find "$CONFIG_DIR" -type d -perm -002 2>/dev/null | grep -q .; then
        security_issues+=("World-writable directories found")
    fi
    
    # Check file permissions
    if find "$CONFIG_DIR" -type f -perm -004 2>/dev/null | grep -q .; then
        security_issues+=("World-readable files found")
    fi
    
    # Verify important files
    local critical_files=(
        "$CONFIG_DIR/termux.properties"
        "$CONFIG_DIR/environment.json"
    )
    
    for file in "${critical_files[@]}"; do
        if [[ -f "$file" ]]; then
            chmod 600 "$file"
        fi
    done
    
    # Report security issues
    if [[ ${#security_issues[@]} -gt 0 ]]; then
        echo -e "${RED}[!] Security issues detected:${RESET}"
        for issue in "${security_issues[@]}"; do
            echo -e "${RED}    - $issue${RESET}"
        done
        
        # Fix permissions
        find "$CONFIG_DIR" -type d -exec chmod 700 {} \;
        find "$CONFIG_DIR" -type f -exec chmod 600 {} \;
    fi
    
    # Create security log
    local log_file="$CONFIG_DIR/security.log"
    {
        echo "Security check performed at: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "Environment: $([[ -d "${ENV_CONFIG[TERMUX_PATH]}" ]] && echo "Termux" || echo "Standard Linux")"
        echo "User ID: $(id -u)"
        echo "Security issues found: ${#security_issues[@]}"
    } > "$log_file"
    
    chmod 600 "$log_file"
}

# Add to main script
main() {
    # Initialize environment
    check_environment
    
    # Verify environment setup
    if [[ ! -f "$CONFIG_DIR/environment.json" ]]; then
        echo -e "${RED}[!] Environment setup failed${RESET}"
        exit 1
    fi
    
    # Continue with rest of script...
    # ... (your existing main function code)
}

# Error handling
trap 'echo -e "${RED}[!] Error occurred in environment setup${RESET}"' ERR

# Run main function
main "$@"

enviroment_setup.sh  chmod +x environment_setup.sh  ./environment_setup.sh

auto_install() {
#!/bin/bash

# ========================================================================
# Termux Security Toolkit
# A script to automate the installation and configuration of security
# and penetration testing tools in Termux
# ========================================================================

# Define color codes for better readability
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Define variables
SIMULATION_MODE=false
PKG_MANAGER=""
TERMUX_PREFIX=""
CONFIG_DIR=""

# Check if running in Termux or standard Linux environment
check_environment() {
    echo -e "${BLUE}[*] Checking system environment...${RESET}"
    
    if [ -d "/data/data/com.termux" ]; then
        # Running in Termux
        PKG_MANAGER="pkg"
        TERMUX_PREFIX="/data/data/com.termux/files/usr"
        CONFIG_DIR="$HOME/.termux"
        echo -e "${GREEN}[✓] Running in Termux environment.${RESET}"
    else
        # Running in standard Linux
        PKG_MANAGER="apt"
        TERMUX_PREFIX="/usr"
        CONFIG_DIR="$HOME/.config/termux"
        echo -e "${YELLOW}[!] Not running in Termux environment. Using standard Linux paths.${RESET}"
    fi
    
    # Create config directory if it doesn't exist
    if [ ! -d "$CONFIG_DIR" ]; then
        mkdir -p "$CONFIG_DIR"
    fi
}

# Function to display the banner
display_banner() {
    clear
    if [ -f "banner.txt" ]; then
        cat banner.txt
    else
        echo -e "${RED}[!] Banner file not found. Creating a simple banner.${RESET}"
        echo -e "${BLUE}=======================================${RESET}"
        echo -e "${BLUE}     TERMUX SECURITY TOOLKIT${RESET}"
        echo -e "${BLUE}=======================================${RESET}"
    fi
    echo -e "==========================================="
    echo -e "  Security Tools Automation for Termux    "
    echo -e "==========================================="
}

# Function to install basic packages
install_basic_packages() {
    echo -e "\n${YELLOW}[*] Installing essential packages...${RESET}"
    
    # Basic packages array
    BASIC_PACKAGES=("coreutils" "git" "wget" "curl" "tar" "zip" "unzip" "nano" "openssh" "openssl" "figlet")
    
    for pkg in "${BASIC_PACKAGES[@]}"; do
        echo -ne "${CYAN}[*] Installing ${pkg}...${RESET}"
        
        if [ "$SIMULATION_MODE" = true ]; then
            sleep 0.2
            echo -e "\r${GREEN}[✓] Installed ${pkg} successfully.${RESET}     "
        else
            # Actual installation command
            if ! command -v "$pkg" &>/dev/null; then
                if [ "$PKG_MANAGER" = "pkg" ]; then
                    pkg install -y "$pkg" &>/dev/null
                else
                    apt install -y "$pkg" &>/dev/null
                fi
                echo -e "\r${GREEN}[✓] Installed ${pkg} successfully.${RESET}     "
            else
                echo -e "\r${GREEN}[✓] ${pkg} is already installed.${RESET}     "
            fi
        fi
    done
    
    echo -e "${BLUE}\n├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "│ ${WHITE}[${GREEN}01${WHITE}]${RESET} │ ${YELLOW}Install Basic Packages${RESET}                              "
    echo -e "│ ${WHITE}[${GREEN}02${WHITE}]${RESET} │ ${YELLOW}Install Programming Languages${RESET}                       "
    echo -e "│ ${WHITE}[${GREEN}03${WHITE}]${RESET} │ ${YELLOW}Install Basic Security Tools${RESET}                        "
    echo -e "│ ${WHITE}[${GREEN}04${WHITE}]${RESET} │ ${YELLOW}Install Advanced Security Tools${WHITE} (${CYAN}Metasploit, etc.${WHITE})${RESET}   "
    echo -e "│ ${WHITE}[${GREEN}05${WHITE}]${RESET} │ ${YELLOW}Configure Terminal Appearance${RESET}                       "
    echo -e "│ ${WHITE}[${GREEN}06${WHITE}]${RESET} │ ${CYAN}Install and Configure EVERYTHING${RESET}                    "
    echo -e "│ ${WHITE}[${GREEN}07${WHITE}]${RESET} │ ${YELLOW}Create Help Guide${RESET}                                   "
    echo -e "│ ${WHITE}[${RED}00${WHITE}]${RESET} │ ${RED}Exit${RESET}                                                 "
    echo -e "╰───────────────────────────────────────────────────────────╯${RESET}"
    
    read -p "$(echo -e $YELLOW"[?] Select an option [0-7]: "$RESET)" choice
    
    case $choice in
        1|01)
            install_basic_packages
            read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
            ;;
        2|02)
            install_programming_languages
            read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
            ;;
        3|03)
            install_basic_security_tools
            read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
            ;;
        4|04)
            install_advanced_security_tools
            read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
            ;;
        5|05)
            configure_terminal
            read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
            ;;
        6|06)
            install_everything
            echo -e "\n${GREEN}[✓] Full installation completed successfully!${RESET}"
            echo
            echo -e "${GREEN}[✓] Thank you for using Termux Security Toolkit!${RESET}"
            echo -e "${YELLOW}[!] Some changes may require restarting Termux to take effect.${RESET}"
            read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
            ;;
        7|07)
            create_help_guide
            read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
            ;;
        0|00)
            echo -e "\n${GREEN}[✓] Thank you for using Termux Security Toolkit!${RESET}"
            exit 0
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            ;;
    esac
}

# Function to check system packages
check_system_packages() {
    echo -e "${BLUE}[*] Checking system packages...${RESET}"
    
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "${GREEN}[✓] System check simulated successfully.${RESET}"
    else
        # Update package lists
        $PKG_MANAGER update &>/dev/null
        
        # Check if essential packages are installed
        if ! command -v git &>/dev/null; then
            echo -e "${YELLOW}[!] git is not installed. Installing...${RESET}"
            $PKG_MANAGER install -y git &>/dev/null
        fi
        
        if ! command -v wget &>/dev/null; then
            echo -e "${YELLOW}[!] wget is not installed. Installing...${RESET}"
            $PKG_MANAGER install -y wget &>/dev/null
        fi
        
        if ! command -v curl &>/dev/null; then
            echo -e "${YELLOW}[!] curl is not installed. Installing...${RESET}"
            $PKG_MANAGER install -y curl &>/dev/null
        fi
        
        echo -e "${GREEN}[✓] System check completed successfully.${RESET}"
    fi
}

# Install core packages and dependencies
install_core_packages() {
    echo -e "${YELLOW}[*] Installing core packages and dependencies...${RESET}"
    PKG_MANAGER="pkg"
    if ! command -v pkg &>/dev/null; then
        PKG_MANAGER="apt"
    fi
    $PKG_MANAGER update -y && $PKG_MANAGER upgrade -y
    $PKG_MANAGER install -y git wget curl python ruby tsu sudo nmap hydra aircrack-ng metasploit hashcat john sqlmap nikto snmp-check wpscan
    # Install pip and python modules
    if command -v pip &>/dev/null; then
        pip install --upgrade pip
        pip install brut3k1t
    fi
    # Install Ruby gems (expanded)
    for gem in wpscan evil-winrm metasploit-framework snmp bundler rake json net-http net-ssh net-telnet colorize; do
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

# Command-line arguments are now handled in the main execution block

# Function to do auto-installation when --auto-install flag is used
auto_install() {
    check_environment
    display_banner
    check_system_packages
    echo -e "${GREEN}[✓] Starting automatic installation of all components${RESET}"
    install_everything
    echo -e "\n${GREEN}[✓] Full installation completed successfully!${RESET}"
    echo
    echo -e "${GREEN}[✓] Thank you for using Termux Security Toolkit!${RESET}"
    echo -e "${YELLOW}[!] Some changes may require restarting Termux to take effect.${RESET}"
    exit 0
}

# Main script execution
if [[ "$1" == "--auto-install" ]]; then
    # Check if the second parameter is --simulate
    if [[ "$2" == "--simulate" ]]; then
        SIMULATION_MODE=true
        echo -e "${YELLOW}[!] Running auto-install in simulation mode. No actual installation will be performed.${RESET}"
    fi
    auto_install
elif [[ "$1" == "--simulate" ]] || [[ "$1" == "-s" ]]; then
    SIMULATION_MODE=true
    echo -e "${YELLOW}[!] Running in simulation mode. No actual installation will be performed.${RESET}"
    check_environment
    main_menu
else
    check_environment
    main_menu
fi
