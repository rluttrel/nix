UEFI

    g (gpt disk label)
    n
    1 (partition number [1/128])
    2048 first sector
    +500M last sector (boot sector size)
    t
    1 (EFI System)
    n
    2
    default (fill up partition)
    default (fill up partition)
    w (write)

Label partitions

This is useful for having multiple setups and makes partitions easier to handle.

    lsblk
    sudo mkfs.fat -F 32 /dev/sdX1
    sudo fatlabel /dev/sdX1 NIXBOOT
    sudo mkfs.ext4 /dev/sdX2 -L NIXROOT
    sudo mount /dev/disk/by-label/NIXROOT /mnt
    sudo mkdir -p /mnt/boot
    sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot

    curl -o https://raw.githubusercontent.com/rluttrel/nix/main/configuration.nix
