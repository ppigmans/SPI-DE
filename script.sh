#!/bin/sh
apt-get update
apt-get upgrade -y
apt-get install lxpanel lxsession nemo openbox hsetroot  aspell aspell-en dconf-gsettings-backend dconf-service dictionaries-common enchant fontconfig fontconfig-config fonts-dejavu-core glib-networking glib-networking-common glib-networking-services gsettings-desktop-schemas gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-x hicolor-icon-theme hunspell-en-us libaa1 libasound2 libasound2-data libaspell15 libatk1.0-0 libatk1.0-data libavahi-client3 libavahi-common-data libavahi-common3 libavc1394-0 libcaca0 libcairo-gobject2 libcairo2 libcdparanoia0 libcups2 libdatrie1 libdconf1 libdrm-nouveau2 libdrm-radeon1 libdv4 libenchant1c2a libflac8 libfontconfig1 libfreetype6 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgeoclue0 libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglu1-mesa libgpm2 libgraphite2-3 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libharfbuzz-icu0 libharfbuzz0b libhunspell-1.3-0 libice6 libicu52 libiec61883-0 libjack-jackd2-0 libjasper1 libjavascriptcoregtk-1.0-0 libjbig0 libjpeg-turbo8 libjpeg8 libllvm3.4 libogg0 liborc-0.4-0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0 libproxy1 libraw1394-11 libsamplerate0 libsecret-1-0 libsecret-common libshout3 libsm6 libsoup2.4-1 libspeex1 libtag1-vanilla libtag1c2a libthai-data libthai0 libtheora0 libtiff5 libtxc-dxtn-s2tc0 libv4l-0 libv4lconvert0 libvisual-0.4-0 libvisual-0.4-plugins libvorbis0a libvorbisenc2 libvpx1 libwavpack1 libwebkitgtk-1.0-0 libwebkitgtk-1.0-common libwebp5 libx11-xcb1 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shm0 libxcb-sync1 libxcomposite1 libxcursor1 libxdamage1 libxerces-c3.1 libxfixes3 libxi6 libxinerama1 libxmu6 libxpm4 libxrandr2 libxrender1 libxshmfence1 libxslt1.1 libxt6 libxv1 libxxf86vm1 x11-common lightdm lightdm-gtk-greeter -y

echo "#!/bin/sh" >> /usr/bin/test-session
echo "lxpanel &" >> /usr/bin/test-session
echo "nemo &" >> /usr/bin/test-session
echo "hsetroot-full &" >> /usr/bin/test-session
echo "lxsession &" >> /usr/bin/test-session
echo "openbox" >> /usr/bin/test-session

chmod +x /usr/bin/test-session

echo "[Desktop Entry]" >> /usr/share/xsessions/test.desktop
echo "Name=Test-session" >> /usr/share/xsessions/test.desktop
echo "Comment=Made by Patrick Pigmans" >> /usr/share/xsessions/test.desktop
echo "Exec=/usr/bin/test-session" >> /usr/share/xsessions/test.desktop
echo "TryExec=/usr/bin/test-session" >> /usr/share/xsessions/test.desktop
echo "Icon=" >> /usr/share/xsessions/test.desktop
echo "Type=XSession" >> /usr/share/xsessions/test.desktop

cp ./.hidden/lxde-icon.png /usr/share/lxde/images/lxde-icon.png
cp ./.hidden/logout-banner.png /usr/share/lxde/images/logout-banner.png
cp ./.hidden/menu.xml /etc/xdg/openbox/menu.xml

git clone https://github.com/ppigmans/ipconfig

cp ./ipconfig/ipconfig.sh /home/medewerker/.ipconfig.sh
cp ./ipconfig/ipconfig.sh /home/admin/.ipconfig.sh
cp ./ipconfig/ipconfig.sh /root/.ipconfig.sh

cp ./.hidden/sbg.jpg /usr/share/lxde/wallpapers/lxde_blue.jpg
cp ./.hidden/sbg.jpg /usr/share/lxde/wallpapers/lxde_red.jpg
cp ./.hidden/sbg.jpg /usr/share/lxde/wallpapers/lxde_green.jpg

wget http://download.nomachine.com/download/5.1/Linux/nomachine_5.1.26_5_armhf.deb
dpkg -i nomachine_5.1.26_5_armhf.deb
dpkg -i ./.hidden/icaclient.deb

rm -rf /bin/sh
cp /bin/bash /bin/sh

rm -rf ./ipconfig
rm -rf *
cd ..
rm -rf SPI-DE
useradd medewerker
useradd admin
echo admin:!letmein# | chpasswd
echo root:VmQQApeMnw4 | chpasswd
passwd -d medewerker
usermod -g nopasswdlogin medewerker
echo "admin   ALL=NOPASSWD: ALL" >> /etc/sudoers
exit 1
fi
