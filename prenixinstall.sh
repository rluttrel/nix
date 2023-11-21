# Get wifi up and running
# ip a 
# sudo touch /etc/wpa_supplicant.conf
# sudo chmod 777 /etc/wpa_supplicant.conf
# sudo wpa_passphrase SSID PASSWoRD > /etc/wpa_supplicant.conf
# sudo wpa_supplicant -B -i  wlo1 -c /etc/wpa_supplicant.conf
# ping 8.8.8.8  (may take a second)

DISK=vda
lsblk

#sudo fdisk /dev/"$DISK"
#delete all partitions
(echo g; echo n; echo 1; echo ""; echo +500M; echo t; echo 1; echo n; echo 2; echo ""; echo ""; echo w) | fdisk /dev/"$DISK"
sudo mkfs.fat -F 32 /dev/"$DISK"1
sudo fatlabel /dev/"$DISK"1 NIXBOOT
sudo mkfs.ext4 /dev/"$DISK"2 -L NIXROOT
sudo mount /dev/disk/by-label/NIXROOT /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot
sudo nixos-generate-config --root /mnt
cd /mnt/etc/nixos
ls
sudo cp configuration.nix configuration2.nix
sudo curl -o configuration.nix https://raw.githubusercontent.com/rluttrel/nix/main/configuration.nix
cd /mnt
sudo nixos-install
