# Void Linux Installation Guide

## Pre-installation Steps

* 1st, Download voidlinux live image from voidlinux website.
* Then, copy the image in a ventoy usb.
* Boot the image and load it using following credentials:
    username: root
    pwd:      voidlinux

* change shell:
    > /bin/bash

* load void installer:
    > void-installer

## Primary Installation 

* select local source
* set keyboard 'us' (default)
* set locale 'en' (Default)
* set hostname
* set timezone: Asia/Dhaka
* **Partitions** (using cfdisk)
    - If the machine is a VM, 2 partitions:
        * /boot/efi > less than 1G, vfat; type: BIOS boot 
        * / > ext4; type: linux file system
        * write then exit
    - If real machine:
        * /boot/efi > less than 1G, usually no need to create, as windows already has created one
        * / > ext4; around 30G 
        * /home > ext4; provide most spaces here, around 100G
* do not install bootloader and graphical menu from here, otherwise it will remove windows boot menu 
* add new user and add the user to at least wheel, network, audio, video, storage and users group
* Select filesystem for / and /home, don't set filesystem for /boot/efi, otherwise it will format and remove windows bootmgr.efi file
* Install, then exit, don't reboot.

## Setup grub and other apps

### Prepare filesystem

* mount psudo filesystems for chroot:
    mount --rbind /sys /mnt/sys && mount --make-rslave /mnt/sys
    mount --rbind /dev /mnt/dev && mount --make-rslave /mnt/dev
    mount --rbind /proc /mnt/proc && mount --make-rslave /mnt/proc

* chroot into new system:
    PS1='(chroot) # ' chroot /mnt/ /bin/bash
* install some very important app using xbps:
    curl
    git
    void-repo-nonfree
    void-repo-multilib-nonfree
    neovim
* change mirrors
    mkdir -p /etc/xbps.d/
    cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
    sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirrors.cnnic.cn/voidlinux|g' /etc/xbps.d/*-repository-*.conf
    xbps-install -S

* add user to group video, Network,users 
* copy files:
    
* install grub:
    xbps-install grub-x86_64-efi
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void"
* if error, add --no-nvram option
* update grub: 
    sudo update-grub
* finalize:
    xbps-reconfigure -fa
* reboot to new system

## Post-Installation

* install these app:
    sudo xbps-install -S lightdm polkit-gnome libXinerama-devel libXft-devel harfbuzz-devel lxappearance feh arc-theme rofi gparted xcompmgr i3-gaps i3lock i3status-rust i3blocks xrdb R-cran-Rcpp mupdf dunst pulseaudio pavucontrol elogind exfat-utils fuse-exfat udisks2 xauth xrandr xdpyinfo nano neovim xdg-utils libappindicator upower bash-completion pulsemixer ranger p7zip ntp dmenu sakura gnome-keyring adwaita-icon-theme arc-theme qutebrowser network-manager-applet font-firacode starship base-devel ncurses-devel evince mupdf xtools xprop python3-pip libreoffice dmenu gpm ueberzug xclip alsa-utils polkit-elogind xdg-user-dirs xdg-user-dirs-gtk mpv youtube-dl ffmpeg tmux sxiv lshw dbus gvfs-afc gvfs-smb gvfs-mtp ntfs-3g feh

* edit /etc/default/grub and insert these and update-grub:
     >> GRUB_DISABLE_OS_PROBER=false

* 
