#!/bin/bash
# Linux Maintenance Automation Script

# Function to display the menu
show_menu() {
    echo "=============================="
    echo " Linux Maintenance Automation "
    echo "=============================="
    echo "1) Update and Upgrade Packages"
    echo "2) Clean Up System"
    echo "3) Check Disk Space"
    echo "4) Exit"
    echo "=============================="
}

# Function to update and upgrade packages
update_packages() {
    echo "Updating package list and upgrading installed packages..."
    sudo apt update && sudo apt upgrade -y
    echo "Update and upgrade complete."
}

# Function to clean up the system
clean_system() {
    echo "Cleaning up unnecessary files..."
    sudo apt autoremove -y && sudo apt clean
    echo "System cleanup complete."
}

# Function to check disk space
check_disk_space() {
    echo "Checking disk space..."
    df -h | grep '^/dev/'
}

# Infinite loop to show the menu until the user chooses to exit
while true; do
    show_menu
    echo -n "Enter your choice: "
    read CHOICE

    case $CHOICE in
        1)
            update_packages
            ;;
        2)
            clean_system
            ;;
        3)
            check_disk_space
            ;;
        4)
            echo "Exiting... Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    echo "Press Enter to continue..."
    read
done
