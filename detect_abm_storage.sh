#!/system/bin/sh

mkdir -p /data/abm/mnt

if [ -b /dev/block/sda1 ] && [[ $(lsblk | grep sda1 | grep ext4) ]]; then
    mount /dev/block/sda1 /data/abm/mnt
    if [ -e /data/abm/mnt/abm-drive.cfg ]; then
        echo "usb"
    fi
    umount /data/abm/mnt
fi

if [ -b /dev/block/mmcblk1p1 ]  && [[ $(lsblk | grep mmcblk1p1 | grep ext4) ]]; then
    mount /dev/block/mmcblk1p1 /data/abm/mnt
    if [ -e /data/abm/mnt/abm-drive.cfg ]; then
        echo "sd"
    fi
    umount /data/abm/mnt
fi

rm -r /data/abm/mnt


