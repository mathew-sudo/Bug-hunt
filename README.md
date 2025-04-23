Termux Security Toolkit
A comprehensive security toolkit for Termux that automates the installation and configuration of essential penetration testing and security analysis tools.

Features
Easy Installation: Automated installation of all required security tools and dependencies
Modular Design: Install only what you need or the entire toolkit
Simulation Mode: Test the installation process without actually modifying your system
Compatible: Works on both Termux and standard Linux environments
Tools Launcher: Quick access to security tools through an interactive menu system
Included Tools
Basic Security Tools
Nmap: Network discovery and security auditing
Hydra: Password cracking tool for various protocols
Ncrack: High-speed network authentication cracking tool
Advanced Security Tools
Metasploit Framework: Penetration testing framework
Aircrack-ng: WiFi security assessment tools
TheFatRat: Payload generator for backdoors and exploits
Brute force tools: Social media and service brute forcing
Programming Languages
Python with pip
Ruby with bundler
Rust
Golang
Erlang
Installation
To install the complete toolkit:

chmod +x termux_security_toolkit.sh
./termux_security_toolkit.sh
Then select option 6 to install and configure everything, or choose specific components to install.

Demo Mode
To see a demonstration of the installation process without actually installing anything:

chmod +x run_demo.sh
./run_demo.sh
Security Tools Launcher
After installation, you can use the security tools launcher for quick access to all security tools:

./security_tools.sh
The launcher provides an interactive menu for:

Network Scanning Tools (Nmap)
Password Cracking Tools (Hydra)
Metasploit Framework
WiFi Analysis Tools (Aircrack-ng)
Brute Force Tools
TheFatRat Payload Generator
Help Guide
For detailed usage instructions and examples, refer to the help guide:

cat security_toolkit_help.txt
Disclaimer
This toolkit is designed for ethical hacking and security research ONLY. Always obtain proper authorization before testing on any network or system. Unauthorized access to systems is illegal and unethical. The developers assume no liability for misuse of these tools.

