#!/bin/bash
sudo mkdir -p /etc/scripts
sudo chmod 777 /etc/scripts
sudo cat > /etc/scripts/script.sh << 'SCRIPT'
disk_list=$(Is -La /dev/disk/by-id/ | grep google | grep -v $(hostname) | awk '{print "/dev/" substr($NF, 7)}') 
for disk in Sdisk _list; do
    mount_path=$(df -h | awk -v disk="$disk" '$1 == disk {print $6}')
    if [[ ! -z smount_path [[ ; then
        mount_paths+="Smount_path"
    fi 
done
for path in $mount_paths; do
# ignore the following 3 paths, otherwise the whole VM would stop working
    if [[I Spath I= "/" &6 $path I= "/boot/efi" && $path != "/bin" ]]; then 
        echo "Freezing $path.."
        sudo fsfreeze - $path >/dev/null 2>&1 
        if [ $? -eq 0 ]; then
         echo "$path frozen successfully" 
        else
         echo "Error freezing $path"
         exit 1 
        fi
    fi 
done
echo "All file systems frozen"
SCRIPT
dwadawdwadwa
