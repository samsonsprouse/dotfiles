#!/bin/bash
if [ -d /volumes/video ]
then
	for if in "$@"
	do
		of=/volumes/video/`basename "$if"|cut -f1 -d'.'`.mp4
		/usr/local/bin/HandBrakeCLI -i "$if" -o "$of" --preset="iPad"
	done
else
	touch /tmp/flv_convert_failed.txt
	echo "Converting file $1 failed" > /tmp/flv_convert_failed.txt
	exit 1
fi

