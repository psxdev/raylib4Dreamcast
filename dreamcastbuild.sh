
## Check if $KOS_BASE is set.
if test ! $KOS_BASE; then { echo "ERROR: Set \$KOS_BASE installing kos sdk and kos-ports before continuing."; exit 1; } fi

## Check if exist kos-ports.
ls -ld $KOS_BASE/../kos-ports 1> /dev/null || { echo "install kos-ports before continuing."; exit 1; }

gitrev=812645b077dbd5579ee5e03d89a6a07f431bf3c6
wget https://github.com/raysan5/raylib/archive/$gitrev.tar.gz
tar xfz $gitrev.tar.gz
cd raylib-$gitrev
patch --strip=1 --input=../Dreamcast_raylib.patch
cd src
make 
make install
