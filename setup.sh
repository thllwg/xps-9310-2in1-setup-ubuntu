#!/bin/bash
set -ex

# Ensure repositories are enabled
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

# Add dell drivers for focal fossa

sudo sh -c 'cat > /etc/apt/sources.list.d/focal-dell.list << EOF
deb http://dell.archive.canonical.com/updates/ focal-dell public
# deb-src http://dell.archive.canonical.com/updates/ focal-dell public

deb http://dell.archive.canonical.com/updates/ focal-oem public
# deb-src http://dell.archive.canonical.com/updates/ focal-oem public

deb http://dell.archive.canonical.com/updates/ focal-somerville public
# deb-src http://dell.archive.canonical.com/updates/ focal-somerville public

deb http://dell.archive.canonical.com/updates/ focal-somerville-melisa public
# deb-src http://dell.archive.canonical.com/updates focal-somerville-melisa public
EOF'

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F9FDA6BED73CDC22

sudo apt update -qq

# Install drivers
#sudo apt install oem-somerville-melisa-meta libfprint-2-tod1-goodix oem-somerville-meta tlp-config -y
sudo apt install oem-somerville-melisa-meta oem-somerville-meta tlp-config -y

# Fix IR emitter problem
sudo apt install gcc -y
wget https://raw.githubusercontent.com/thllwg/linux-enable-ir-emitter/master/enable-ir-emitter.c && wget https://raw.githubusercontent.com/thllwg/linux-enable-ir-emitter/master/enable-ir-emitter.service 
sudo gcc enable-ir-emitter.c -o enable-ir-emitter && \
     ./enable-ir-emitter && \
     sudo cp enable-ir-emitter.service /etc/systemd/system/ && \
     sudo systemctl enable enable-ir-emitter && \
     sudo systemctl start enable-ir-emitter && \
     sudo rm enable-ir-emitter.c enable-ir-emitter.service 

# Gotta reboot now:
sudo apt update -qq && sudo apt upgrade -y && sudo apt autoremove -y

echo $'\n'$"Ready for REBOOT"
