#!/bin/bash
#Check if fr24feed installed and file install_dump1090.sh exists
if ! [ -f  /usr/lib/fr24/install_dump1090.sh ]; then echo "fr24feed not installed, install fr24feed before using this script!"; exit 1; fi

#Fix PI24 image's "readonly file system".
mount -o remount,rw /
sed -i -e 's?$(mount | grep " on / " | grep rw)?{ mount | grep " on / " | grep rw; }?' /usr/lib/fr24/fr24feed_updater.sh &>/dev/null

systemctl stop fr24feed

sed -i 's/.*1.14/#&/' /usr/lib/fr24/install_dump1090.sh

sed -i '/wget -O \/tmp\/dump1090-mutability_1.14_armhf.deb/i\    wget -O \/tmp\/dump1090-mutability_1.15_dev_armhf.deb https:\/\/github.com\/abcd567a\/dump1090\/releases\/download\/v1\/dump1090-mutability_1.15_dev_armhf.deb\n    dpkg -i \/tmp/dump1090-mutability_1.15_dev_armhf.deb\n    rm -f /tmp/dump1090-mutability_1.15_dev_armhf.deb\n' /usr/lib/fr24/install_dump1090.sh

# different install methods depending on receiver-type
if grep -q "^receiver.*dvbt" /etc/fr24feed.ini
then
	rm -f /usr/lib/fr24/dump1090
	/usr/lib/fr24/install_dump1090.sh
else
	wget -O /tmp/dump1090-mutability_1.15_dev_armhf.deb https://github.com/abcd567a/dump1090/releases/download/v1/dump1090-mutability_1.15_dev_armhf.deb
	dpkg -i /tmp/dump1090-mutability_1.15_dev_armhf.deb
	rm -f /tmp/dump1090-mutability_1.15_dev_armhf.deb
fi


service lighttpd force-reload

systemctl restart fr24feed

echo "---------------"
echo "ALL DONE !"
echo "---------------"
echo "Go to your browser and check map at the following address"
echo "http://IP-of-Pi/dump1090/"
echo "If new map does not show:"
echo "Clear browser cache (Ctrl+Shift+Delete) and Reload Browser (Ctrl+F5)"
