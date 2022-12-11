#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Set the backup directory
BACKUP_DIR="/var/backups"

# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir $BACKUP_DIR
fi

# Set the date and time
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Create the backup file
BACKUP_FILE="$BACKUP_DIR/$DATE.tar.gz"
tar -czf $BACKUP_FILE /etc

# Run the script
/path/to/script.sh

# Check if the script failed
if [ $? -ne 0 ]; then
  # Restore the backup
  tar -xzf $BACKUP_FILE -C /
fi
