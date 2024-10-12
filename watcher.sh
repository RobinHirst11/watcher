#!/bin/bash

os_name=$(uname -s)
package_manager=""

if [[ "$os_name" == "Linux" ]]; then
    if command -v apt &> /dev/null; then
        package_manager="apt"
    elif command -v pacman &> /dev/null; then
        package_manager="pacman"
    elif command -v dnf &> /dev/null; then
        package_manager="dnf"
    elif command -v yum &> /dev/null; then
        package_manager="yum"
    elif command -v zypper &> /dev/null; then
        package_manager="zypper"
    fi
elif [[ "$os_name" == "Darwin" ]]; then
    if command -v brew &> /dev/null; then
        package_manager="brew"
    fi
fi

if ! command -v mpv &> /dev/null; then
    echo "mpv is not installed."

    if [[ -n "$package_manager" ]]; then
        read -p "Do you want to install mpv using $package_manager? [Y/n] " choice
        choice=${choice:-Y} # Set default to 'Y' if empty

        if [[ "$choice" == "y" || "$choice" == "Y" ]]; then  #check for both y and Y
            if [[ "$package_manager" == "apt" ]]; then
                sudo apt update && sudo apt install -y mpv
            elif [[ "$package_manager" == "pacman" ]]; then
                sudo pacman -S mpv
            elif [[ "$package_manager" == "dnf" ]]; then
                sudo dnf install mpv
            elif [[ "$package_manager" == "yum" ]]; then
                sudo yum install mpv
            elif [[ "$package_manager" == "zypper" ]]; then
                sudo zypper install mpv
            elif [[ "$package_manager" == "brew" ]]; then
                brew install mpv
            fi
            if ! command -v mpv &> /dev/null; then
                echo "mpv installation failed."
                exit 1
            fi
        else
            echo "Exiting."
            exit 1
        fi
    else
        echo "Could not determine your package manager. Please install mpv manually."
        exit 1
    fi
fi

video_file="$1"

if [ -z "$video_file" ]; then
    echo "Usage: $0 <video_file>"
    exit 1
fi

if [ ! -f "$video_file" ]; then
    echo "Error: File '$video_file' not found."
    exit 1
fi

mpv --fs --loop-file --no-border --input-default-bindings=no --script-opts=osc-layout=box,osc-seekbarstyle=bar --input-conf=/dev/null "$video_file"
