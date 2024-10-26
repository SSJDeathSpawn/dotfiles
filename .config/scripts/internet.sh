#!/usr/bin/env bash

choice=$(printf "Wi-fi\nProxy\nVIT" | rofi -dmenu)
echo $choice
if [ $choice = "Wi-fi" ]; then
	networkmanager_dmenu
elif [ "$choice" = "Proxy" ]; then
	next=$(printf "Start\nStop" | rofi -dmenu)

	if [ "$next" = "Start" ]; then
		systemctl start proxifier.service
	elif [ "$next" = "Stop" ]; then
		systemctl stop proxifier.service
	fi

elif [ "$choice" = "VIT" ]; then
	next=$(printf "Login\nLogout" | rofi -dmenu)

	if [ "$next" = "Login" ]; then
		login-internet
	elif [ "$next" = "Logout" ]; then
		logout-internet
	fi
fi
