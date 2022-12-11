#!/bin/bash

# Update the system
apt-get update
apt-get upgrade -y

# Install necessary packages
apt-get install -y fail2ban ufw openssh-server

# Configure the firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

# Configure fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sed -i 's/bantime = 600/bantime = 3600/' /etc/fail2ban/jail.local
sed -i 's/findtime = 600/findtime = 3600/' /etc/fail2ban/jail.local
systemctl restart fail2ban

# Harden SSH
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart ssh

# Create a new user and add them to the sudo group
adduser [USERNAME]
usermod -aG sudo [USERNAME]

# Create a new SSH key pair for the new user
sudo -u [USERNAME] ssh-keygen -t rsa -b 4096 -f /home/[USERNAME]/.ssh/id_rsa -q -N ""

# Add the public key to the authorized_keys file
cat /home/[USERNAME]/.ssh/id_rsa.pub | sudo -u [USERNAME] tee -a /home/[USERNAME]/.ssh/authorized_keys

# Set the correct permissions on the .ssh directory and authorized_keys file
chmod 0700 /home/[USERNAME]/.ssh
chmod 0600 /home/[USERNAME]/.ssh/authorized_keys

# Lock down the new user's account
passwd -l [USERNAME]
