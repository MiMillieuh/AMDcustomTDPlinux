#!/bin/bash

if [[ "$USER" != "root" ]]; then
    echo "Error: script not running as root or with sudo! Exiting..."
    exit 1
fi

git clone https://github.com/FlyGoat/RyzenAdj.git

cd RyzenAdj

mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=Release ..

make

cd ../

cp -r build /opt/ryzenadj

rm -rf ../RyzenAdj

cd /opt/ryzenadj

wget https://raw.githubusercontent.com/MiMillieuh/AMDcustomTDPlinux/main/customTDP.sh

chmod +x customTDP.sh

wget https://raw.githubusercontent.com/MiMillieuh/AMDcustomTDPlinux/main/amd-custom-tdp.service

mv amd-custom-tdp.service /etc/systemd/system/

systemctl enable amd-custom-tdp.service
systemctl start amd-custom-tdp.service

echo "now installed"

exit 0
