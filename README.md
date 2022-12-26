This is a simple post installation helper for installing KDE Plasma with some applications on Void Linux.

How to use:
1. After base installtion of Void Linux...
2. Login with your user name and password
3. Run sudo xbps-install -Su 
4. Run sudo xbps-install void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree 
Then run sudo xbps-install xorg kde5 kde5-baseapps xdg-user-dirs xdg-utils xtools  micro NetworkManager bluez tlp tlp-rdw preload rsync kate git
5. After completion, run the following commands to start services:
- sudo ln -s /etc/sv/dbus /var/service/
- sudo ln -s /etc/sv/sddm /var/service/
- sudo ln -s /etc/sv/elogind /var/service/
- sudo sv up dbus
- sudo sv up sddm
6. sudo reboot to reboot.
7. git clone https://gitlab.com/asifakonjee/void-linux-kde.git 
8. cd /void-linux-kde
9. Open the file in Kate and then paste them into the terminal to install. 
10. After completion, reboot.
11. Now, you have KDE Plasma on Void Linux with very basic applications installed.

### Alternative Script Install (Advance usage only):
1. After base installation of Void Linux...
- Login with your user name and password
- Run sudo xbps-install -y git micro
- sudo git clone https://gitlab.com/asifakonjee/void-linux-kde.git
- cd void-linux-kde
- sudo chmod +x install.sh
- sudo ./install.sh
2. Then wait for installation to complete
3. You may need to give your password a few times during installation.
4. After completion of the script, run the following commands to start services:
- sudo ln -s /etc/sv/dbus /var/service/
- sudo ln -s /etc/sv/sddm /var/service/
- sudo ln -s /etc/sv/elogind /var/service/
- sudo sv up dbus
- sudo sv up sddm
5. sudo reboot to reboot.
6. Now, you have KDE Plasma on Void Linux with very basic applications installed.

Thanks.
