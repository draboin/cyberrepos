#!/bin/bash

# Check for common backdoor programs and remove them
if [ -f "/usr/bin/ncat" ]; then
  rm /usr/bin/ncat
fi
if [ -f "/usr/bin/nc" ]; then
  rm /usr/bin/nc
fi
if [ -f "/usr/bin/wget" ]; then
  rm /usr/bin/wget
fi

# Check for common backdoor files and remove them
if [ -f "~/.ssh/authorized_keys" ]; then
  rm ~/.ssh/authorized_keys
fi
if [ -f "~/.ssh/id_rsa" ]; then
  rm ~/.ssh/id_rsa
fi
if [ -f "~/.ssh/id_rsa.pub" ]; then
  rm ~/.ssh/id_rsa.pub
fi

# Check for common backdoor directories and remove them
if [ -d "~/.ssh" ]; then
  rm -rf ~/.ssh
fi
if [ -d "/tmp/backdoor" ]; then
  rm -rf /tmp/backdoor
fi
