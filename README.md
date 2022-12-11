# cyberrepos
This is a collection of cyber bash scripts

If you want to use these scripts without downloading you can use #curl

Here are the Curls for each File:

curl https://raw.githubusercontent.com/draboin/cyberrepos/main/Ascript.sh | bash

curl https://raw.githubusercontent.com/draboin/cyberrepos/main/adduser.sh | bash

curl https://raw.githubusercontent.com/draboin/cyberrepos/main/backdoors.sh | bash

curl https://raw.githubusercontent.com/draboin/cyberrepos/main/backup.sh | bash

curl https://raw.githubusercontent.com/draboin/cyberrepos/main/blacklist.sh | bash

curl https://raw.githubusercontent.com/draboin/cyberrepos/main/findsdoor.sh | bash

curl https://raw.githubusercontent.com/draboin/cyberrepos/main/perlfinders.sh | bash



Ip image:
tcpdump -i eth0 -A "tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)" | grep -a -o -E "GET .* HTTP/1\.1"
