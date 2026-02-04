# Termux Security Toolkit

A comprehensive security toolkit for Termux and Linux environments that automates the installation and configuration of essential penetration testing and security analysis tools.

---

## N2ncloud Security Platform

**N2ncloud** is a revolutionary AntiMalware Security Platform built in C# with Windows Forms. It provides comprehensive protection through an XXL Security Database.

### Features
- **Scan Module**: Quick, Full, Custom, and Boot-Time scanning capabilities
- **Firewall**: Advanced network traffic filtering and protection
- **Offence/Defence**: Countermeasure and active defense tools
- **Network**: Real-time network monitoring and traffic analysis
- **Maintenance**: System health and security maintenance tools
- **Intrusion Detection**: Real-time monitoring for unauthorized access
- **Behavior Analysis**: AI-powered suspicious activity detection
- **Quarantine**: Isolated storage for detected threats
- **Advanced Algorithm Security**: Proprietary deep threat analysis
- **Tracing**: Network packet and connection tracking
- **NextGen AI**: Machine learning-based threat detection
- **Tools/Options/Settings/Configuration**: Full customization

### XXL Security Database (1,220,000+ Signatures)
- **AntiVirus**: 150,000 signatures
- **AntiMalware**: 250,000 signatures
- **AntiSpyware**: 100,000 signatures
- **AntiBotnet**: 75,000 signatures
- **AntiHack**: 50,000 signatures
- **AntiWorm**: 80,000 signatures
- **AntiTrojan**: 120,000 signatures
- Plus: Rootkit, Ransomware, Adware, PUP, Keylogger, Backdoor, Exploit detection

### Building N2ncloud
```sh
cd N2ncloud
dotnet build
dotnet run
```

**Requirements**: .NET 8.0 SDK with Windows Forms support

---

## Features
- **Easy Installation:** Automated installation of all required security tools and dependencies
- **Modular Design:** Install only what you need or the entire toolkit
- **Simulation Mode:** Test the installation process without modifying your system
- **Compatible:** Works on both Termux and standard Linux environments
- **Tools Launcher:** Quick access to security tools through an interactive menu system
- **No-Auth Mode:** Authentication prompts are bypassed automatically for streamlined usage
- **Defensive Setup:** All installs are best-effort, with safe privilege escalation and configuration

## Included Tools
### Basic Security Tools
- Nmap: Network discovery and security auditing
- Hydra: Password cracking tool for various protocols
- Ncrack: High-speed network authentication cracking tool

### Advanced Security Tools
- Metasploit Framework: Penetration testing framework
- Aircrack-ng: WiFi security assessment tools
- TheFatRat: Payload generator for backdoors and exploits
- Brute force tools: Social media and service brute forcing
- Searchsploit: Exploit database search utility

### Programming Languages
- Python with pip
- Ruby with bundler
- Rust
- Golang
- Erlang

## Installation
To install the complete toolkit:
```sh
chmod +x termux_security_toolkit.sh
./termux_security_toolkit.sh
```
Select option 6 to install and configure everything, or choose specific components to install.

## Demo Mode
To see a demonstration of the installation process without actually installing anything:
```sh
chmod +x run_demo.sh
./run_demo.sh
```

## Security Tools Launcher
After installation, you can use the security tools launcher for quick access to all security tools:
```sh
./security_tools.sh
```
The launcher provides an interactive menu for:
- Network Scanning Tools (Nmap)
- Password Cracking Tools (Hydra)
- Metasploit Framework
- WiFi Analysis Tools (Aircrack-ng)
- Brute Force Tools
- TheFatRat Payload Generator
- Searchsploit

## Help Guide
For detailed usage instructions and examples, refer to the help guide:
```sh
cat security_toolkit_help.txt
```

## No-Auth Mode
The toolkit features a No-Auth mode that automatically:
- Bypasses authentication prompts in security tools
- Auto-generates credentials when needed
- Simplifies tool usage with pre-configured settings
- Creates automatic configurations for tools like Metasploit and TheFatRat
- Shows "NO-AUTH MODE ENABLED" in the toolkit banner
This mode is ideal for rapid deployments where you want to avoid interactive authentication prompts.

## Defensive Setup & Privilege Escalation
- All installs and configuration changes are best-effort and safely validated
- Sudoers configuration is validated before applying
- Privilege escalation uses tsu or sudo when available, with clear user feedback

## Disclaimer
This toolkit is designed for ethical hacking and security research **ONLY**. Always obtain proper authorization before testing on any network or system. Unauthorized access to systems is illegal and unethical. The developers assume no liability for misuse of these tools.
