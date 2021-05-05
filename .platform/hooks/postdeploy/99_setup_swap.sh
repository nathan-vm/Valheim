#!/bin/bash
set -e

SWAPFILE=/var/swapfile
SWAP_MEGABYTES=${SWAP_MEGABYTES:-2048}

if [ -f $SWAPFILE ]; then
    echo "Swapfile $SWAPFILE found, putting swap off to re-setup"
    /sbin/swapoff $SWAPFILE
fi

/bin/dd if=/dev/zero of=$SWAPFILE bs=1M count=$SWAP_MEGABYTES
/bin/chmod 600 $SWAPFILE
/sbin/mkswap $SWAPFILE
/sbin/swapon $SWAPFILE
