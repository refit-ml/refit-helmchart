#cp -r 
## need to change 
#### version 
#### copyfrom: this can be automated one backup process is automated. 



version=26
volnum=`kubectl get pv | grep "refit-release/refit-notebook" | gawk '{print $1}' | cut -d "-" -f 4`
copyto="/mnt-gluster/cdl-data/refit/r${version}/vol-${volnum}/"
copyfrom="../backups/cdl-data/refit/r25/vol-3/*"
echo "copying notebook data from $copyfrom to ${copyto} "

cp -r $copyfrom $copyto

chmod -R 777 $copyto
