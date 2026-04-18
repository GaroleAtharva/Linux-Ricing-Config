#!/usr/bin/env bash

# Export the DBUS_SESSION_BUS_ADDRESS so gnome-keyring can talk to the system
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

# Start the GNOME Keyring Daemon (This fixes Chrome/Brave/Edge losing logins)
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# Set environment for i3
export XDG_CURRENT_DESKTOP=i3
export XDG_SESSION_TYPE=x11
export DESKTOP_SESSION=i3
export GDMSESSION=i3

# Start i3
exec i3
