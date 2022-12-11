#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Prompt for the name of the program to blacklist
read -p "Enter the name of the program to blacklist: " PROGRAM

# Create the blacklist file if it doesn't exist
BLACKLIST_FILE="/etc/blacklist"
if [ ! -f "$BLACKLIST_FILE" ]; then
  touch $BLACKLIST_FILE
fi

# Add the program to the blacklist file
echo $PROGRAM >> $BLACKLIST_FILE

# Create the wrapper script if it doesn't exist
WRAPPER_SCRIPT="/usr/local/bin/blacklist_wrapper"
if [ ! -f "$WRAPPER_SCRIPT" ]; then
cat << EOF > $WRAPPER_SCRIPT
#!/bin/bash

# Check if the program is blacklisted
if grep -Fxq "\$1" $BLACKLIST_FILE; then
  echo "This program is blacklisted" 1>&2
  exit 1
else
  exec "\$@"
fi
EOF

# Set the correct permissions on the wrapper script
chmod 755 $WRAPPER_SCRIPT

# Replace the program's original binary with the wrapper script
mv /usr/bin/$PROGRAM /usr/bin/$PROGRAM.original
ln -s $WRAPPER_SCRIPT /usr/bin/$PROGRAM

echo "The program '$PROGRAM' has been blacklisted"
