#!/bin/bash

# Check for system updates first, because priorities!
sudo apt-get update && sudo apt-get full-upgrade && sudo apt autoremove && sudo apt autoclean -y

# Then scan through log files and report any new entries. 
for file in /var/log/*.*; do
    lastUpdate=$(stat -c '%Y' "$file")
    now=$(date +%s)
    if [ $((now - lastUpdate)) -gt 3600 ]; then
        echo "New entry found: ${file} updated at $(date --date=@$lastUpdate)"
    fi
done
