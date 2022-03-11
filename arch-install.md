# Installation Guide for Arch Linux

## Pre-Installation (After Booting ISO)

* increase font size:
    setfont ter-118n
* check internet connection (folllow EF Linux Youtube channel):
    ip a 
* add bangladeshi mirror:
    * install: > sudo pacman -S reflector curl rsync
    * backup /etc/pacman.d/mirrorlist
    * replace mirrorlist using reflector: > sudo reflector --country Bangladesh --protocol http --sort rate --save /etc/pacman.d/mirrorlist
    * sync repos: > sudo pacman -Sy


    Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch
* update pacman server:
    pacman -Syy
* partition disk using gdisk or cfdisk (follow <https://www.youtube.com/watch?v=sBzAC4glyvE>)
    * create 04 drives: vfat efi partition, swap, root and home
    * check partitions using: > lsblk
    * format efi partition using:
        mkfs.fat -F 32 /dev/vda1
        fatlabel /dev/vda1 EFI
    * partition swap:
        mkswap -L SWAP /dev/vda2
        swapon /dev/vda2
    * partition root and home:
        mkfs.ext4 -L ROOT /dev/vda3
        mkfs.ext4 -L HOME /dev/vda4
* mount partitions:
    mount /dev/vda3 /mnt
    mkdir -p /mnt/home
    mount /dev/vda4 /mnt/home
    mkdir -p /mnt/boot/efi
    mount /dev/vda1 /mnt/boot/efi
* check again: > lsblk

## Start Setup

## pacstrap 
    pacstrap /mnt base linux linux-firmware git curl neovim intel-ucode

## create fstab using label
    genfstab -L /mnt >> /mnt/etc/fstab

## chroot into archlinux
    arch-chroot /mnt

# Installation:

* Download this script from eflinux: > curl -LO https://gitlab.com/eflinux/arch-basic/-/raw/master/base-uefi.sh
* or use following script (there are some slight changes):
---
#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Dhaka /etc/localtime
hwclock --systohc
#sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
#echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:a | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m rms
echo rms:a | chpasswd
usermod -aG libvirt rms

echo "rms ALL=(ALL) ALL" >> /etc/sudoers.d/rms


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"

---

## add intel driver
* in /etc/mkinitcpio.conf, inside the bracket of MODULES put i915
* run: > sudo mkinitcpio -p linux 
*
