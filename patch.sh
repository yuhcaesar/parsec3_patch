sed -i "s/=item \([0-9]\)/=item '\1'/g" $(find . -name "*.pod")
cp ./bsd__types.h pkgs/libs/uptcpip/src/include/sys/bsd__types.h
sudo apt-get install -y build-essential m4 x11proto-xext-dev libglu1-mesa-dev libxi-dev libxmu-dev libtbb-dev
