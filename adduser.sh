#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Check if the user wants to add or delete a user
while true; do
  read -p "Do you want to add or delete a user? [add/delete]: " ANSWER
  case $ANSWER in
    add ) ADD_USER=true; break;;
    delete ) DELETE_USER=true; break;;
    * ) echo "Please enter 'add' or 'delete'";;
  esac
done

if [ "$ADD_USER" = true ]; then
  # Prompt for the username
  read -p "Enter the username: " USERNAME

  # Check if the user is an administrator
  while true; do
    read -p "Is this user an administrator? [y/n]: " ADMIN
    case $ADMIN in
      y ) ADMIN=true; break;;
      n ) ADMIN=false; break;;
      * ) echo "Please enter 'y' or 'n'";;
    esac
  done

  # Add the user
  useradd $USERNAME

  # Set the user's password
  passwd $USERNAME

  if [ "$ADMIN" = true ]; then
    # Add the user to the sudo group
    usermod -aG sudo $USERNAME
  fi

elif [ "$DELETE_USER" = true ]; then
  # Prompt for the username
  read -p "Enter the username: " USERNAME

  # Delete the user
  userdel $USERNAME

  # Remove the user's home directory
  rm -rf /home/$USERNAME
fi
