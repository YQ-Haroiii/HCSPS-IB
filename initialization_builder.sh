#!/bin/bash

function title() {
    clear

    echo "██╗  ██╗ ██████╗███████╗██████╗ ███████╗        ██╗██████╗ ";
    echo "██║  ██║██╔════╝██╔════╝██╔══██╗██╔════╝        ██║██╔══██╗";
    echo "███████║██║     ███████╗██████╔╝███████╗        ██║██████╔╝";
    echo "██╔══██║██║     ╚════██║██╔═══╝ ╚════██║        ██║██╔══██╗";
    echo "██║  ██║╚██████╗███████║██║     ███████║███████╗██║██████╔╝";
    echo "╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝     ╚══════╝╚══════╝╚═╝╚═════╝ ";
}

function setup(){
    title

    sudo apt -y update
    sudo apt -y upgrade

    main
}

function main() {
    title

    echo "HCSPS Initialization Builder Version 1.0"
    echo "Developed by YuQing Ho"
    
    echo -e

    echo "Install Packages : "
    echo "├─ (1) Node.js & npm"
    echo "├─ (2) Python & pip"
    echo "└─ (3) Zip"

    echo -e

    echo "(Ctrl + C) Exit"

    echo -e

    read -p "Enter your choice : " choice

    if [ $choice -eq 1 ]; then
        __INSTALL_NODE
    elif [ $choice -eq 2 ]; then
        __INSTALL_PYTHON
    elif [ $choice -eq 3 ]; then
        __INSTALL_ZIP
    else
        title
        echo "Invalid choice!"
        sleep 2
        main
    fi
}

function __INSTALL_NODE() {
    title
    echo "Remove old version of node..."
    sudo apt-get remove -y libnode-dev

    title
    echo "Installing Node.js & npm..."
    sudo curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y -f nodejs

    title
    echo "Installing npm..."
    sudo apt-get install -y -f aptitude
    sudo aptitude install -y npm
    sudo npm install -g npm

    title
    echo "Installed Successfully!"
    sleep 2

    main
}

function __INSTALL_PYTHON() {
    title
    echo "Python version : "

    echo "├─ (1) 3.9.0"
    echo "├─ (2) 3.10.0"
    echo "├─ (3) 3.11.0"
    echo "└─ (4) 3.12.0"

    echo -e

    echo "(E) Exit"

    echo -e

    read -p "Enter your choice : " choice

    title

    case $choice in
        1)
            echo "Installing Python 3.9.0..."
            sudo apt install -y python3.9
            ;;
        2)
            echo "Installing Python 3.10.0..."
            sudo apt install -y python3.10
            ;;
        3)
            echo "Installing Python 3.11.0..."
            sudo apt install -y python3.11
            ;;
        4)
            echo "Installing Python 3.12.0..."
            sudo apt install -y python3.12
            ;;
        E)
            main
            ;;
        *)
            echo "Invalid choice."
            sleep 2
            __INSTALL_PYTHON
            ;;
    esac

    title
    echo "Installed Successfully!"
    sleep 2

    main
}

function __INSTALL_ZIP() {
    title
    echo "Installing zip..."
    sudo apt install zip -y

    title
    echo "Installing unzip..."
    sudo apt install unzip -y

    title
    echo "Installed Successfully!"
    sleep 2

    main
}

setup