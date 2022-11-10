#! /bin/sh

<<comment
Prerequisites:
-Auzure build must be running on the SAMA5

 Written by:
 __  __     
/\ \/ /     
\ \  _"-.  
 \ \_\ \_\  
  \/_/\/_/ 

comment

#--------------START WORK--------------------

sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

chown iotedge:iotedge /var/run/iotedge/
chown iotedge:iotedge /var/lib/iotedge/

systemctl restart iotedge 
journalctl -u iotedge -f
