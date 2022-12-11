#!/bin/bash

# Check for common backdoor programs
if [ -f "/usr/bin/ncat" ]; then
  echo "Possible backdoor found: /usr/bin/ncat"
fi
if [ -f "/usr/bin/nc" ]; then
  echo "Possible backdoor found: /usr/bin/nc"
fi
if [ -f "/usr/bin/wget" ]; then
  echo "Possible backdoor found: /usr/bin/wget"
fi

# Check for common backdoor files
if [ -f "~/.ssh/authorized_keys" ]; then
  echo "Possible backdoor found: ~/.ssh/authorized_keys"
fi
if [ -f "~/.ssh/id_rsa" ]; then
  echo "Possible backdoor found: ~/.ssh/id_rsa"
fi
if [ -f "~/.ssh/id_rsa.pub" ]; then
  echo "Possible backdoor found: ~/.ssh/id_rsa.pub"
fi

# Check for common backdoor directories
if [ -d "~/.ssh" ]; then
  echo "Possible backdoor found: ~/.ssh directory"
fi
if [ -d "/tmp/backdoor" ]; then
  echo "Possible backdoor found: /tmp/backdoor directory"
fi
