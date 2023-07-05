#!/bin/sh
version=$1
for i in {1..31}
do
    echo "Creating folder /mnt-gluster/all-data/refit/$version/vol-$i"
    mkdir /mnt-gluster/all-data/refit/$version/vol-$i
    chmod -R 777 /mnt-gluster/all-data/refit/$version/vol-$i
done
