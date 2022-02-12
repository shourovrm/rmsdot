---
Output: pdf_document
---

## Done After Installation

1. Blacklisted nouveau

2. Installed xfce4-pulseaudio-plugin and add it in xfce-panel

3. Installed ntfs-3g as mentioned in my voidrice.md file

4. Installed libX11-devel noto-fonts-emoji xorg-fonts font-inconsolata-otf base-devel

5. Installed: st (from my own repo, make it as default in Xfce-settings > Default Applications

6. Installed: mpv, ffmpeg, xrdb, zathura-pdf-mupdf, git, font-libertine-ttf,

7. Create own config repo in gitub (to be done!!!)

## Installation for Rstudio

1. Install these using xbps:
  1.1 R-cran-stringi
  1.2 R-cran-stringr
  1.3 libxml2-devel
  1.4 libcurl-devel
  1.5 libgfortran-devel
  1.6 gcc-fortran
  1.8 openblas-devel



## Sync Google Drive

1. Follow voidrice instructions
2. create a autostart command in "Sessions and Startup" in Xfce-Setting with following command:

  > rclone mount --daemon gdrive: /home/rshourov/gdrive/


## Install Brave Browser and Zoom using xdeb

### Install xdeb (<https://github.com/toluschr/xdeb>)

1. Download xdeb script to ~/.local/bin:

   > curl -LO https://raw.githubusercontent.com/toluschr/xdeb/master/xdeb
2. make it executable:
	> sudo chmod 0744 xdeb

### Install zoom

1. Download zoom deb file from official page
2. convert it to xbps:
	> xdeb -Sde <zoom version>.deb [-Sde will check dependencies]
3. install using xbps as directed at the result of xdeb command:
	> sudo xbps-install -R binpkg <package-name>

### Install brave browser

1. Download brave browser deb file from github releases
2. convert it to xbps:
	> xdeb -Sde <brave version>.deb [-Sde will check dependencies]
3. install using xbps as directed at the result of xdeb command:
	> sudo xbps-install -R binpkg <package-name>
4. make it as default browser in Xfce-Settings > Default Applications


### Installed packages for voidrice-i3

1. calcurse
2. ranger
3. unclutter
4. xmodmap
5. xrandr
6. xcompmgr/ picom
7. ueberzug
8. fzf
9. w3m-img
10. rofi

### Installed for xfce-plugin and other things in i3

1. xfce4-whiskermenu-plugin
2. xfce4-sensors-plugin
3. xfce4-screenshooter
4. xprop (to find window name)
5. volctl (system tray volume icon)

used voidrice scripts from: <https://github.com/tenomax-hash/LukeSmith-voidrice>

### Wine and Playonlinux

1. wine
2. winetricks
3. playonlinux
4. libGL-32bit
