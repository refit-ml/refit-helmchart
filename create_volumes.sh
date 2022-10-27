#!/bin/sh
version=$1
for i in {1..31}
do
    echo "Creating folder /mnt-gluster/cdl-data/refit/$version/vol-$i"
    mkdir /mnt-gluster/cdl-data/refit/$version/vol-$i
    chmod -R 777 /mnt-gluster/cdl-data/refit/$version/vol-$i
done
