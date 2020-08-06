#!/bin/bash
#---------------------------------------------------------------------------------------------------
# curl -sSL https://raw.githubusercontent.com/clh021/sh/master/init.sh | sudo sh
#---------------------------------------------------------------------------------------------------
# download+sigCheck+usbBoot+EFICheck
# ls /sys/firmware/efi/efivars
# iwd: device list | station device scan | station device get-networks | station device connect SSID
# timedatectl set-ntp true
# fdisk -l | kfs.ext4 /dev/sdX1 | mount /dev/sdX1 /mnt
#---------------------------------------------------------------------------------------------------
# pacstrap /mnt base linux linux-firmware
# genfstab -U /mnt >> /mnt/etc/fstab
# arch-chroot /mnt
#---------------------------------------------------------------------------------------------------
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# locale.gen
echo LANG=en_US.UTF-8 > /etc/locale.gen
echo LANG=en_US.UTF-8 >> /etc/locale.gen
echo LANG=en_US.UTF-8 >> /etc/locale.gen
export LANG=en_US.UTF-8

# hosts
echo lc > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 lc.localdomain lc" >> /etc/hosts

# boot loader 
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI /dev/nvme0n1p5
grub-mkconfig -o /boot/grub/grub.cfg

# Fonts
pacman -S noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji ttf-liberation ttf-dejavu ttf-roboto ttf-inconsolata ttf-font-awesome ttf-ubuntu-font-family

# Tools # zstd快速无损压缩算法
pacman -S zip unzip tar unrar wget htop mesa clang cmake vim git python openssh npm go pacman-contrib firefox alacritty linux-headers bash-completion pkgconfig autoconf automake man p7zip bzip2 zstd xz gzip

# network
pacman -S networkmanager dhcpcd
systemctl enable NetworkManager

# Docker
pacman -S docker docker-compose
systemctl enable docker

# archlinux-cn
#echo Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch >> /etc/pacman.d/mirrorlist
#sudo pacman -Syy
#archlinuxcn-keyring

# Graphics
# pacman -S bumblebee mesa xf86-video-intel nvidia-dkms qt5-wayland clutter glfw-wayland glew-wayland mesa vulkan-radeon libva-mesa-driver mesa-vdpau

# SWay
pacman -S sway swayidle swaylock swaybg waybar brightnessctl
pacman -S gdm qt5-wayland # clutter glfw-wayland glew-wayland
#pacman -S swayshot # on aur
###SWAYSHOT_SCREENSHOTS="/home/shino/Screenshots"
###SWAYSHOT_DATEFMT="%F-%H-%M-%S"

# sudo account
pacman -S sudo
passwd arch
#visudo /etc/sudoers
# root password
#passwd
#sudo -s
#echo "proc /proc proc defaults,nosuid,nodev,noexec,relatime,hidepid=2 0 0" >> /etc/fstab
#exit
