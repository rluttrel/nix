# Nix OS minimal install
#sudo su
#nano /etc/wpa_supplicant.conf
#network={
#    ssid="ballnet"
#    psk="cowpigdonkey1"
#}
#ifconfig
#wpa_supplicant -B -i wlp0s20f3 -c /etc/wpa_supplicant.conf  


#echo "Enter the termux ip address : "
#read termux_ip
#echo "Termux ip address is ${termux_ip}"
#echo "sshuttle -r ${termux_user}@${termux_ip}:8022 0/0 -x ${my_ip}/24"G

export http_proxy="http://192.0.0.2:8080"
export https_proxy="https://192.0.0.2:8080"
export ftp_proxy="http://192.0.0.2:8080"

curl www.google.com

nix-shell -p git

#Partition drive

echo "Enter the drive name : "
read drivename

lsblk 
echo "Drive name is ${drivename}"
sgdisk --zap-all /dev/${drivename}
sgdisk -n 1:0:+1G -c 1:boot -t 1:ef00 /dev/${drivename}
sgdisk -n 2 /dev/${drivename}

mkfs.fat -F 32 /dev/${drivename}1
fatlabel /dev/${drivename}1 NIXBOOT
mkfs.ext4 /dev/${drivename}2 -L NIXROOT
mount /dev/disk/by-lable/NIXROOT /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-lable/NIXBOOT /mnt/boot

nixos-generate-config --root /mnt
cd /mnt
nixos-install
