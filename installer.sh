#!/bin/bash
PANEL="/home/pi/.config/lxpanel/LXDE-pi/panels/panel"
if grep -Fq "type=cpu" $PANEL
then
	echo "CPU panel already present"
else
	echo "Adding CPU panel"
	printf "Plugin {\n  type=cpu\n  Config {\n    ShowPercent=1\n    Foreground=#ffff00000000\n    Background=#d3d3d3d3d3d3\n  }\n}" >> $PANEL
fi
if grep -Fq "type=thermal" $PANEL
then
	echo "Thermal panel already present"
else		
	echo "Adding Thermal panel"
	printf "Plugin {\n  type=thermal\n  Config {\n    NormalColor=#00ff00\n    Warning1Color=#FF8C00\n    Warning2Color=#ff0000\n    AutomaticLevels=0\n    Warning1Temp=45\n    Warning2Temp=50\n    AutomaticSensor=1\n  }\n}" >> $PANEL
fi
if grep -Fq "type=monitors" $PANEL
then
	echo "Monitor panel already present"
else
	echo "Adding Monitor panel"
	printf "Plugin {\n  type=monitors\n  Config {\n    DisplayCPU=0\n    DisplayRAM=1\n    RAMColor=#0000FF\n  }\n}" >> $PANEL
fi
if grep -Fq "type=netstatus" $PANEL
then
	echo "NetStatus panel already present"
else
	echo "Adding NetStatus panel"
	printf "Plugin {\n  type=netstatus\n  Config {\n  }\n}" >> $PANEL
fi
echo "UI configuration updated."
echo -n "Reboot Now? (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
    echo "rebooting down..."
	sudo reboot now
fi
