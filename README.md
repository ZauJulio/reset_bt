# reset_bt

This script blocks the bluetooth controller and removes the registered addresses, then unblock and restart the bluetooth service. The script also creates a service to automatically run it at system startup.

# Install

```bash
sudo chmod +x ./reset_bt.sh
sudo ./reset_bt.sh
```

# usage

```bash
sudo reset_bt
```

# Uninstall

```bash
sudo systemctl stop reset_bt
sudo systemctl disable reset_bt
sudo rm /usr/bin/reset_bt.sh
sudo rm /etc/systemd/system/reset_bt.service
sudo systemctl daemon-reload
```

##### Made for Linux <img src="https://media.giphy.com/media/1411KIyKAWaztu/source.gif" width="40px">
