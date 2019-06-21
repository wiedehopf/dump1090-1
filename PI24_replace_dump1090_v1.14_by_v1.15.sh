#!/bin/bash

sed -i 's/.*1.14/#&/' /usr/lib/fr24/install_dump1090.sh

sed -i '/wget -O \/tmp\/dump1090-mutability_1.14_armhf.deb/i\    wget -O \/tmp\/dump1090-mutability_1.15_dev_armhf.deb https:\/\/github.com\/abcd567a\/dump1090\/releases\/download\/v1\/dump1090-mutability_1.15_dev_armhf.deb\n    dpkg -i \/tmp/dump1090-mutability_1.15_dev_armhf.deb\n    rm -f /tmp/dump1090-mutability_1.15_dev_armhf.deb\n' /usr/lib/fr24/install_dump1090.sh

sudo dpkg --purge dump1090-mutability

cd /usr/lib/fr24/

sudo ./install_dump1090.sh

sudo service lighttpd force-reload

sudo systemctl restart fr24feed

