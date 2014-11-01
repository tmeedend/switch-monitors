#!/bin/bash
PID=""
CONFIG_FILE=~/.monitors-enabled

function get_enabled_monitors {
   MONITORS=`cat $CONFIG_FILE`
}


function dvi_only {
	echo  "Enabling DVI only"
	xrandr --output HDMI-0 --off --output DVI-I-3 --primary
	echo "DVI_ONLY" > $CONFIG_FILE
	nvidia-settings --load-config-only
}

function hdmi_only {
	echo  "Enabling HDMI only"
 	xrandr --output DVI-I-3 --off --output HDMI-0 --primary
	echo "HDMI_ONLY" > $CONFIG_FILE
	nvidia-settings --load-config-only
}

function both {
	echo  "Enabling BOTH MONITORS"
	xrandr --output HDMI-0 --auto --left-of DVI-I-3 --output DVI-I-3 --primary
	echo "BOTH" > $CONFIG_FILE
	nvidia-settings --load-config-only
}

function switch {
  get_enabled_monitors
   if [ -z $MONITORS ]
	then
	dvi_only
   elif [ "$MONITORS" = "DVI_ONLY" ]
	then
      	both
   elif [ "$MONITORS" = "BOTH" ]
	then
      	dvi_only 
   else
   	echo "never configured"
   fi

}



function status {
   get_enabled_monitors
   if [ -z  $MONITORS ]; then
      echo "never configured"
      exit 1
   else
      echo "Monitors configured are  $MONITORS"
   fi
}


case "$1" in
   switch)
      switch
   ;;
   both)
      both
   ;;
   dvi-only)
      dvi_only
   ;;
   hdmi-only)
      hdmi_only
   ;;
   status)
      status
   ;;
   *)
      echo "Usage: $0 {switch|dvi-only|hdmi-only|both|status}"
esac
