sed -i "s/=item \([0-9]\)/=item '\1'/g" $(find . -name "*.pod")
cp ./bsd__types.h ./pkgs/libs/uptcpip/src/include/sys/bsd__types.h
cp ./netstreamcluster-gcc-serial.bldconf ./pkgs/netapps/netstreamcluster/parsec/gcc-serial.bldconf
cp ./netdedup-gcc-serial.bldconf ./pkgs/netapps/netdedup/parsec/gcc-serial.bldconf
cp ./netferret-gcc-serial.bldconf ./pkgs/netapps/netferret/parsec/gcc-serial.bldconf
sudo apt-get install -y build-essential m4 x11proto-xext-dev libglu1-mesa-dev libxi-dev libxmu-dev libtbb-dev libssl-dev
