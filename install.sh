#! /bin/bash

echo "Note that this will not work unless run as root or with sudo"
read -p "Do you know what this script will do? [Y/n] " -n 1
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo -e "\nThen you need to read the manual!"
    cat README
else
    if [ `whoami` == "root" ]
    then
        cp /usr/share/wicd/gtk/netentry.py /usr/share/wicd/gtk/netentry.py.old
        cp netentry.py /usr/share/wicd/gtk/netentry.py
        cp wep.sh /usr/share/wicd/wep.sh
        chmod +x /usr/share/wicd/wep.sh
        echo -e "\n Done. Changes will take effect next time you start wicd-client"
    else
        echo -e "\nNeeds to be root! Exiting..."
    fi
fi
