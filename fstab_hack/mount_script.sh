#!/bin/bash

for label in Volume0 Volume1
do
	dev=$(lsblk -l --output=NAME,LABEL | grep $label | awk '{print $1}')
	mkdir -p /media/$label
	mount -t ext4 /dev/$dev /media/$label
done

dev=$(lsblk -l | grep part | grep -v / | awk '{print $1}')
mkdir -p /media/Volume2
mount -t ext4 /dev/$dev /media/Volume2