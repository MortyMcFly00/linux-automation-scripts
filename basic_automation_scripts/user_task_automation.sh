#!/bin/bash
# user Input Automation Script

# Greet the user and get their name
echo "Welcome to the Automation Script!"
echo "Please enter your name:"
read USERNAME

while true; do
  echo "Hello, $USERNAME! What would you like to do today?"
  echo "1) Check Disk Usage"
  echo "2) Show System Uptime"
  echo "3) List Running Processes"
  echo "4) Exit"

  # Get the user's choice
  echo -n "Enter your choice: "
  read CHOICE

  #Execute the action based on user choice
  case $CHOICE in
    1)
      echo "Disk Usage:"
      df -h
      ;;
    2)
      echo "System Uptime:"
      uptime
      ;;
    3)
      echo "Running Processes:"
      ps aux
      ;;
    4)
      echo "Goodbye. $USERNAME!"
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac

  echo "Press Enter to continue..."
  read
done

