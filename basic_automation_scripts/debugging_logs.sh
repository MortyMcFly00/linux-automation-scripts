#!/bin/bash
# Debugging and Logs Automation Script

# This script monitors system events and logs them to a file

# Define the log file location
LOG_FILE="system_events.log"

# Function to display the menu
show_menu() {
    echo "=============================="
    echo " System Events Monitoring Script "
    echo "=============================="
    echo "1) View Recent Logs"
    echo "2) Clear Log File"
    echo "3) Monitor Hardware Events (dmesg)"
    echo "4) Exit"
    echo "=============================="
}

# Function to view recent logs
view_logs() {
    if [ -f "$LOG_FILE" ]; then
        echo "Recent Logs:"
        tail -n 20 "$LOG_FILE"
    else
        echo "No log file found."
    fi
}

# Function to clear the log file
clear_logs() {
    if [ -f "$LOG_FILE" ]; then
        > "$LOG_FILE"
        echo "Log file cleared."
    else
        echo "No log file to clear."
    fi
}

# Function to monitor hardware events and append to log file
monitor_events() {
    echo "Monitoring hardware events... (Press Ctrl+C to stop)"
    sudo dmesg -w | while read line; do
        echo "$(date): $line" >> "$LOG_FILE"
    done
}

# Infinite loop to show the menu until the user chooses to exit
while true; do
    show_menu
    echo -n "Enter your choice: "
    read CHOICE

    case $CHOICE in
        1)
            view_logs
            ;;
        2)
            clear_logs
            ;;
        3)
            monitor_events
            ;;
        4)
            echo "Exiting... Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
    esac

    echo "Press Enter to continue..."
    read
done
