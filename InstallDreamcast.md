# Install for Dreamcast
- Install last kos and kos-port follow steps from https://dreamcast.wiki/Getting_Started_with_Dreamcast_development
- clone this repository and execute if you are in Unix like environtment including wsl2:
```
./dreamcastbuild.sh
```

# Samples
- in each sample use make to build
```
% cd samples
% ls
models  shapes
% cd models
% ls
cubicmap
% cd cubicmap
% ls
Makefile  main.c  romdisk
% make
rm -f raylib.elf romdisk.*
kos-cc  -c main.c -o main.o
/usr/local/dcdev/kos/utils/genromfs/genromfs -f romdisk.img -d romdisk -v -x .svn -x .keepme
0    rom 1706461643       [0xffffffff, 0xffffffff] 37777777777, sz     0, at 0x0
1    .                    [0x820     , 0x5c9     ] 0040755, sz     0, at 0x20
1    ..                   [0x820     , 0x5951b   ] 0040755, sz     0, at 0x40     [link to 0x20    ]
1    cubicmap_atlas.png   [0x820     , 0x59520   ] 0100644, sz 37160, at 0x60
1    cubicmap.png         [0x820     , 0x5951f   ] 0100644, sz   164, at 0x91c0
/usr/local/dcdev/kos/utils/bin2o/bin2o romdisk.img romdisk romdisk_tmp.o
/usr/local/dcdev/sh-elf/bin/sh-elf-gcc -o romdisk.o -r romdisk_tmp.o -L/usr/local/dcdev/kos/lib/dreamcast -L/usr/local/dcdev/kos/addons/lib/dreamcast -L/usr/local/dcdev/kos/../kos-ports/lib -Wl,--whole-archive -lromdiskbase
rm romdisk_tmp.o
kos-cc -o raylib.elf main.o romdisk.o -lraylib -lGL -lm -lkosutils
```
- If you have a broadband adapter make it happy using 
```
% dc-tool-ip -t HEREYOURDREAMCASTIP -x  raylib.elf
```

Enjoy!!!!

