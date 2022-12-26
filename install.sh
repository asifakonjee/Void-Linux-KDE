#!/bin/bash
# A simple script to get a vanilla KDE Plasma Desktop on Void Linux
# Version 1.0.1, updated 14-12-2022
clear

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 45
    kill -0 "$$" || exit
  done 2>/dev/null &
}
echo "Welcome to a simple script to get a vanilla KDE Plasma Desktop on Void Linux."
read -p "Would you like to continue (y/n)? " installChoice

case "$installChoice" in
  # User wants to continue installation
  y|Y|yes|Yes|YES )

    read -p "Would you like to perform a system upgrade before continuing (y/n)? " upgradeChoice
    case "$upgradeChoice" in
      y/Y/yes/Yes/YES )
        echo "Upgrading system..."
        sudo xbps-install -Su
      ;;
      n/N/no/No/NO )
        echo "Skipping system upgrade."
      ;;
    esac

    echo "Installing multilib and non-free repos..."
      sudo xbps-install -y void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

    echo "Preparing to install packages..."
      echo "Installing build essentials and kernel headers..."
        sudo xbps-install -y base-devel make cmake rust cargo rsync
      echo "Installing graphics drivers..."
        sudo xbps-install -y intel-video-accel mesa-intel-dri mesa-vulkan-intel vulkan-loader
#      echo "Installing fonts..."
#        sudo xbps-install -y fontconfig font-iosevka ttf-material-icons nerd-fonts ttf-ubuntu-font-family terminus-font
      echo "Installing audio packages..."
        sudo xbps-install -y alsa-utils alsa-plugins-pulseaudio ffmpeg ffmpegthumbs pulseaudio pipewire
      echo "Installing desktop environment..."
        sudo xbps-install -y xorg kde5 kde5-baseapps xdg-user-dirs xdg-utils xtools
      echo "Installing utilities and system tools..."
        sudo xbps-install -y gvfs gvfs-mtp gzip ntp procps-ng udisks2 unzip zip ark wget curl plymouth bluez tlp tlp-rdw preload zstd
      echo "Installing additional applications..."
        sudo xbps-install -y neofetch htop alacritty kvantum timeshift qt5-devel exa grub-customizer spectacle kcalc gwenview fbv ntfs-3g telegram-desktop hplip octoxbps qbittorrent
        # Edit the following list of additional applications or replace them with your own preferences
        # Code editor
        echo "Installing Text Editors..."
        sudo xbps-install -y micro kate nano
        # PDF reader
        echo "Installing Evince..."
        sudo xbps-install -y okular
        # Web browser
        echo "Installing Firefox..."
        sudo xbps-install -y firefox
        # Screenshot utility
        # Image editor
        echo "Installing GIMP..."
        sudo xbps-install -y gimp
        # Office suite
        echo "Installing LibreOffice..."
        sudo xbps-install -y libreoffice
        # Audio and video player
        echo "Installing VLC..."
        sudo xbps-install -y vlc
        # Audio recording and streaming
        echo "Installing OBS Studio..."
        sudo xbps-install -y obs
        # File manager...atool is installed for the ranger_archives plugin to work properly
        echo "Installing Ranger..."
        sudo xbps-install -y ranger atool
        # Install ZSH and Oh My ZSH
        echo "Installing ZSH..."
        sudo xbps-install -y zsh
        
    echo "Configuring system..."
      echo "Setting up services..."
        sudo sed -i "s/--noclear/--noclear\ --skip-login\ --login-options=$USER/g" /etc/sv/agetty-tty1/conf
    sudo rm -f /var/service/agetty-tty{3,4,5,6}
    sudo ln -s /etc/sv/dbus /var/service/
    sudo ln -s /etc/sv/sddm /var/service/
    sudo ln -s /etc/sv/NetworkManager /var/service/

    echo "Starting services..."
    sudo sv up dbus
    sudo sv up sddm
    sudo sv up NetworkManager 
    
    echo "All done! Please reboot for all changes to take effect."
  ;;

  # User does not want to continue installation.
  n|N|no|No|NO )
    echo "Thanks for trying, Goodbye!";;
esac
