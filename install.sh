#! /bin/bash

echo "Note that this will not work unless run as root or with sudo"
read -p "This will copy gtk/netentry.py to /usr/share/wicd/gtk/netentry.py. A backup of the original file will be placed in /usr/share/wicd/gtk/netentry.py.old - Continue? [Y/n] " -n 1
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo -e "\nOk bye."
else
    if [ `whoami` == "root" ]
    then
        cp /usr/share/wicd/gtk/netentry.py /usr/share/wicd/gtk/netentry.py.old
        cp gtk/netentry.py /usr/share/wicd/gtk/netentry.py
        echo -e "\n Done. Changes will take effect next time you start wicd-client"
    else
        echo -e "\nNeeds to be root! Exiting..."
    fi
fi
