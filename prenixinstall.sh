lsblk

sudo fdisk /dev/sda
#delete all partitions
sudo mkfs.fat -F 32 /dev/sda1
sudo fatlabel /dev/sda1 NIXBOOT
sudo mkfs.ext4 /dev/sda2 -L NIXROOT
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
