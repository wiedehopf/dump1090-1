# dump1090
precompiled package of dump1090-mutability ver 1.15~dev for Raspberry Pi

Release 1, Package Built on Raspberry Pi 2 Model B ARMv7 / Raspbian Stretch

To install on Raspbian / ARMv7 ARMv8

sudo apt install librtlsdr0

wget -O /home/pi/dump1090-mutability_1.15_dev_armhf.deb https://github.com/abcd567a/dump1090/releases/download/v1/dump1090-mutability_1.15_dev_armhf.deb 

cd /home/pi/

sudo dpkg -i dump1090-mutability_1.15_dev_armhf.deb

In PI24 image of FlightRadar24, to replace dump1090-mutbility ver 1.14 by ver 1.15

sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/dump1090/master/PI24_replace_dump1090_v1.14_by_v1.15.sh)"
