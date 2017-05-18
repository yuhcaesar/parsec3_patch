# PARSEC 3.0 installation patch

## HOW-TO-USE-IT

Copy all files to parsec 3.0 root dir.

```
cp ./parsec3_patch/* Where-Paresc3.0-Is/`
```

execute the patch.sh.

```
./patch.sh
```

## PARSEC 3.0 installation issues

1. Download

* [PARSEC3.0](http://parsec.cs.princeton.edu/download.htm)

2. Install following packages on Ununtu 14.04

```
sudo apt-get install -y build-essential m4 x11proto-xext-dev libglu1-mesa-dev libxi-dev libxmu-dev libtbb-dev libssl-dev`
```

3. Correct compile error

1) FTBFS(Fails To Build From Source) with perl 5.18
    
Error message is like below.

```
xxx.pod arround line XXX: Experted text after =item, not a number`
```
        
It is because of perl verison conflict. Go to line specified in specified file (xxx.pod) and change `=item 1` to `=item '1'` or `=item C<1>`. Or use following shell script

```
sed -i "s/=item \([0-9]\)/=item '\1'/g" $(find . -name "*.pod")`
```
        
2) __mbstate_t conflict (Thanks to yulistic)
    
Error memsage is like below.

```
error: conflicting type for '__mbstate_t' ...
```
        
It is because of conflict between system declauration and parsec library. Comment out the declaration of "__mbstate" in `[PARSEC_ROOT_DIR]/pkgs/libs/uptcpip/src/include/sys/bsd__types.h`. Or just copy a corrected .h file to that path.

3) gcc-serial configure file incorrections
    
Error memssage is like below.

```
make[1]: *** No rule to make target /home/precise/yuh-work/Benchmark/parsec-3.0/pkgs/netapps/netferret/obj/amd64-linux.gcc-serial/server/parsec/obj/ferret-serial.o', needed by /home/precise/yuh-work/Benchmark/parsec-3.0/pkgs/netapps/netferret/obj/amd64-linux.gcc-serial/server/parsec/bin/ferret-serial'.  Stop.
```
        
It is because of the missing file "ferrect-serial.c". So it can't be corrected if we don't have the correct source file, but we can mute the compiler by commenting out the line "build_env=..." in the configure file (gcc.bldconf) or just copying the "corrected" configure file to the path "[PARSEC_ROOT_DIR]/pkgs/netapps/netferret/parsec/gcc-serial.bldconf"

```
fatal error: uptcp_socket.h: No such file or directiory
```
       
It's because of the lacking options in "build_env". Go to line specified in specified gcc-serial.bldconf and change "build_env=..." to:

(netdedup):
        
```
build_env="version=serial CFLAGS=\"-I${PARSECDIR}/pkgs/libs/ssl/inst/${PARSECPLAT}/include -I${PARSECDIR}/pkgs/libs/uptcpip/inst/${PARSECPLAT}/include -I${PARSECDIR}/pkgs/libs/zlib/inst/${PARSECPLAT}/include ${CFLAGS}\" LDFLAGS=\"-L${PARSECDIR}/pkgs/libs/ssl/inst/${PARSECPLAT}/lib -L${PARSECDIR}/pkgs/libs/zlib/inst/${PARSECPLAT}/lib -L${PARSECDIR}/pkgs/libs/uptcpip/inst/${PARSECPLAT}/lib ${LDFLAGS}\""
```

(netstreamcluster):
        
```
build_env="version=serial CXXFLAGS=\"-I${PARSECDIR}/pkgs/libs/uptcpip/inst/${PARSECPLAT}/include ${CXXFLAGS}\" LDFLAGS=\"-L${PARSECDIR}/pkgs/libs/uptcpip/inst/${PARSECPLAT}/lib ${LDFLAGS}\""
```
        
Or just copy a corrected file to the path `[PARSEC_ROOT_DIR]/pkgs/XXX/XXX/parsec/gcc-serial.bldconf`.

## REFERANCE

1. https://yulistic.gitlab.io/2016/05/parsec-3.0-installation-issues/

2. http://parsec.cs.princeton.edu/parsec3-doc.htm#simulation        
   
