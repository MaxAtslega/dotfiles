#!/bin/bash

# This is the name of the sink
MODULE_NAME=Focusrite-Solo

# check if a module with (part of) that name exists 
if [[ `pactl list short sources | grep $MODULE_NAME` =~ $MODULE_NAME ]]; then 
    echo "$MODULE_NAME exists, exiting"
else
	pactl load-module module-remap-source master=alsa_input.usb-Focusrite_Scarlett_Solo_USB_Y7KPDHQ1C2A5B1-00.pro-input-0 source_name=$MODULE_NAME master_channel_map=left channel_map=mono sink_name=$MODULE_NAME
    echo "$MODULE_NAME created"
fi
