#!/usr/bin/env bash
# Termux Security Toolkit - Main Installation Script
# Defensive options, color codes, package manager detection, core tool installs.
set -euo pipefail
IFS=$'\n\t'

RED='\033[0;31m'; YELLOW='\033[0;33m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; RESET='\033[0m'

banner() {
  echo -e "${CYAN}===========================================${RESET}"
  echo -e "${CYAN}      Termux Security Toolkit v1.0         ${RESET}"
  echo -e "${CYAN}===========================================${RESET}"
}

pkg_manager() {
  if command -v pkg >/dev/null 2>&1; then echo pkg
  elif command -v apt >/dev/null 2>&1; then echo apt
  else echo ""; fi
}

install_core_packages() {
  echo -e "${YELLOW}[*] Installing core packages and dependencies...${RESET}"
  local PM; PM=$(pkg_manager)
  if [ -z "$PM" ]; then echo -e "${RED}[✗] No supported package manager (pkg/apt) found.${RESET}"; return 1; fi
  $PM update -y || true
  $PM upgrade -y || true
  local pkgs=(git wget curl python ruby tsu sudo nmap hydra aircrack-ng metasploit hashcat john sqlmap nikto)
  for p in "${pkgs[@]}"; do $PM install -y "$p" || echo -e "${YELLOW}[!] Failed to install $p${RESET}"; done

  if command -v pip >/dev/null 2>&1; then
    pip install --upgrade pip || true
    pip install brut3k1t || true
  fi

  if command -v gem >/dev/null 2>&1; then
    for gem in wpscan evil-winrm metasploit-framework snmp; do
      if ! gem list | grep -q "^$gem "; then
        gem install "$gem" --no-document || true
      fi
    done
  fi

  if ! command -v searchsploit >/dev/null 2>&1; then
    git clone https://github.com/offensive-security/exploitdb.git "$HOME/exploitdb" 2>/dev/null || true
    ln -s "$HOME/exploitdb/searchsploit" /usr/local/bin/searchsploit 2>/dev/null || true
  fi
  echo -e "${GREEN}[✓] Core packages and dependencies processed.${RESET}"
}

banner
install_core_packages
