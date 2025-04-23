#!/bin/bash

# Demo script to showcase the Termux Security Toolkit functionality

echo -e "\033[1;36m[*] Running Termux Security Toolkit Demo\033[0m"
echo

# Display banner
cat ./banner.txt
echo -e "===========================================
  Security Tools Automation for Termux    
==========================================="
echo

# Simulate basic packages installation
echo -e "\033[1;33m[*] Installing essential packages...\033[0m"
sleep 0.5
for pkg in coreutils git wget curl tar zip unzip nano openssh openssl figlet; do
    echo -ne "\033[36m[*] Installing ${pkg}...\033[0m"
    sleep 0.2
    echo -e "\r\033[32m[✓] Installed ${pkg} successfully.\033[0m     "
done
echo -e "\033[32m[✓] Basic packages installation completed.\033[0m"
echo

# Simulate programming languages installation
echo -e "\033[1;33m[*] Installing programming languages...\033[0m"

echo -ne "\033[36m[*] Installing Python...\033[0m"
sleep 0.3
echo -e "\r\033[32m[✓] Installed Python successfully.\033[0m     "
echo -ne "\033[36m[*] Upgrading pip...\033[0m"
sleep 0.2
echo -e "\r\033[32m[✓] Upgraded pip successfully.\033[0m     "

echo -ne "\033[36m[*] Installing Ruby...\033[0m"
sleep 0.3
echo -e "\r\033[32m[✓] Installed Ruby successfully.\033[0m     "
echo -ne "\033[36m[*] Installing Bundler...\033[0m"
sleep 0.2
echo -e "\r\033[32m[✓] Installed Bundler successfully.\033[0m     "

echo -ne "\033[36m[*] Installing Rust...\033[0m"
sleep 0.3
echo -e "\r\033[32m[✓] Installed Rust successfully.\033[0m     "

echo -ne "\033[36m[*] Installing Golang...\033[0m"
sleep 0.3
echo -e "\r\033[32m[✓] Installed Golang successfully.\033[0m     "

echo -ne "\033[36m[*] Installing Erlang...\033[0m"
sleep 0.3
echo -e "\r\033[32m[✓] Installed Erlang successfully.\033[0m     "

echo -e "\033[32m[✓] Programming languages installation completed.\033[0m"
echo

# Simulate security tools installation
echo -e "\033[1;33m[*] Installing basic security tools...\033[0m"

for tool in "Nmap" "Hydra" "Ncrack" "ImageMagick" "ncurses"; do
    echo -ne "\033[36m[*] Installing ${tool}...\033[0m"
    sleep 0.4
    echo -e "\r\033[32m[✓] Installed ${tool} successfully.\033[0m     "
done

echo -e "\033[32m[✓] Basic security tools installation completed.\033[0m"
echo

# Simulate advanced security tools installation
echo -e "\033[1;33m[*] Installing advanced security tools...\033[0m"

echo -ne "\033[36m[*] Installing dependencies...\033[0m"
sleep 0.5
echo -e "\r\033[32m[✓] Installed dependencies successfully.\033[0m     "

echo -e "\033[36m[*] Installing Metasploit Framework...\033[0m"
sleep 1.0
echo -e "\033[32m[✓] Installed Metasploit Framework successfully.\033[0m"

echo -ne "\033[36m[*] Installing Aircrack-ng...\033[0m"
sleep 0.5
echo -e "\r\033[32m[✓] Installed Aircrack-ng successfully.\033[0m     "

echo -e "\033[36m[*] Installing TheFatRat...\033[0m"
sleep 0.5
echo -e "\033[32m[✓] Downloaded TheFatRat successfully.\033[0m"
echo -e "\033[33m[!] TheFatRat has been downloaded but not installed.\033[0m"
echo -e "\033[33m[!] To complete installation, manually run:\033[0m"
echo -e "\033[33m   cd ~/TheFatRat && ./setup.sh\033[0m"

echo -e "\033[36m[*] Installing BruteForce tools...\033[0m"
sleep 0.5
echo -e "\033[32m[✓] Downloaded brut3k1t successfully.\033[0m"
echo -e "\033[32m[✓] Installed required Python dependencies.\033[0m"

echo -e "\033[32m[✓] Advanced security tools installation completed.\033[0m"
echo

# Simulate terminal configuration
echo -e "\033[1;33m[*] Configuring terminal appearance...\033[0m"

echo -ne "\033[36m[*] Creating configuration directory...\033[0m"
sleep 0.3
echo -e "\r\033[32m[✓] Configuration directory created successfully.\033[0m     "

echo -ne "\033[36m[*] Setting up color scheme...\033[0m"
sleep 0.5
echo -e "\r\033[32m[✓] Color scheme applied successfully.\033[0m     "

echo -ne "\033[36m[*] Setting up font...\033[0m"
sleep 0.3
echo -e "\r\033[33m[!] OpenDyslexic font needs to be downloaded manually.\033[0m     "
echo -e "\033[33m[!] Download the font and copy it to ~/.termux/font.ttf\033[0m"

echo -ne "\033[36m[*] Setting up terminal properties...\033[0m"
sleep 0.4
echo -e "\r\033[32m[✓] Terminal properties applied successfully.\033[0m     "

echo -ne "\033[36m[*] Setting up bash profile...\033[0m"
sleep 0.5
echo -e "\r\033[32m[✓] Bash profile configured successfully.\033[0m     "

echo -e "\033[36m[*] Applying terminal changes...\033[0m"
sleep 0.5

echo -e "\033[32m[✓] Terminal configuration completed.\033[0m"
echo -e "\033[33m[!] Some changes may require restarting Termux to take effect.\033[0m"
echo

# Simulate cleanup
echo -e "\033[1;33m[*] Cleaning up...\033[0m"

echo -ne "\033[36m[*] Removing temporary files...\033[0m"
sleep 0.5
echo -e "\r\033[32m[✓] Cleanup completed successfully.\033[0m     "

echo -ne "\033[36m[*] Updating all packages...\033[0m"
sleep 0.7
echo -e "\r\033[32m[✓] All packages updated successfully.\033[0m     "
echo

# Create help guide
echo -e "\033[1;33m[*] Creating help guide...\033[0m"
sleep 0.7
echo -e "\033[32m[✓] Help guide created successfully at ./security_toolkit_help.txt\033[0m"
echo

# Completion message
echo -e "\033[1;32m[✓] Full installation completed successfully!\033[0m"
echo
echo -e "\033[1;32m[✓] Thank you for using Termux Security Toolkit!\033[0m"
echo -e "\033[1;33m[!] Some changes may require restarting Termux to take effect.\033[0m"
