#!/bin/bash


# Script to download bluetooth addresses and restart the service
# Author: Zaú Júlio A. Galvão

# Uninstall: sudo systemctl stop reset_bt && sudo systemctl disable reset_bt && sudo systemctl disable reset_bt && sudo rm /usr/bin/reset_bt && sudo systemctl daemon-reload

# Create script to reset
sudo touch  /usr/bin/reset_bt.sh
sudo echo "# Script to restart the service and bluetooth addresses" >> /usr/bin/reset_bt.sh	# Description
sudo echo "sudo rfkill block bluetooth" >> /usr/bin/reset_bt.sh 				# Disable device
sudo echo "sudo rm -r /var/lib/bluetooth/*" >> /usr/bin/reset_bt.sh				# Clear addresses
sudo echo "sudo rfkill unblock bluetooth" >> /usr/bin/reset_bt.sh				# Enable device	
sudo echo "sudo systemctl restart bluetooth" >> /usr/bin/reset_bt.sh				# Restart bluetooth service
sudo chmod +x /usr/bin/reset_bt.sh								# Add permissions
# END


# Create service
sudo touch /etc/systemd/system/reset_bt.service

sudo echo "[Unit]" >> /etc/systemd/system/reset_bt.service							# Init unit
sudo echo "Description=Restart the service and bluetooth addresses" >> /etc/systemd/system/reset_bt.service 	# Description

sudo echo "[Service]" >> /etc/systemd/system/reset_bt.service					# Define service
sudo echo "Type=simple" >> /etc/systemd/system/reset_bt.service					# Define service type
sudo echo "ExecStart=/bin/bash /usr/bin/reset_bt.sh" >> /etc/systemd/system/reset_bt.service	# Set script initialization

sudo echo "[Install]" >> /etc/systemd/system/reset_bt.service				# Set script installation
sudo echo "WantedBy=multi-user.target" >> /etc/systemd/system/reset_bt.service		# Set wait for script to complete
sudo chmod 664 /etc/systemd/system/reset_bt.service					# Add permissions
# END


# Automatically switch output
sudo echo "# automatically switch to newly-connected devices" >> /etc/pulse/default.pa 	# Description
sudo echo "load-module module-switch-on-connect" >> /etc/pulse/default.pa		# Change outgoing connection automatically when connecting device
#END


# Enable in boot and start service
sudo systemctl daemon-reload
sudo systemctl start reset_bt.service	# Start service
sudo systemctl enable reset_bt.service	# Set service startup at boot
# END


# DONE!
sudo echo "Done! Reconnect the device."

