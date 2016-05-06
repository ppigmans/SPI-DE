#!/bin/sh

apt-get install lxpanel lxsession nemo openbox hsetroot

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


cp ./.hidden/sbg.jpg /usr/share/lxde/wallpapers/lxde_blue.jpg
cp ./.hidden/sbg.jpg /usr/share/lxde/wallpapers/lxde_red.jpg
cp ./.hidden/sbg.jpg /usr/share/lxde/wallpapers/lxde_green.jpg


exit 1
fi
