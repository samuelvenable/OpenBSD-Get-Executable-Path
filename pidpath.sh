#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall -arch arm64 -arch x86_64; ./pidpath;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./pidpath;
  else
    clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall; ./pidpath;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall -static; ./pidpath;
elif [ $(uname) = "DragonFly" ]; then
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./pidpath;
elif [ $(uname) = "NetBSD" ]; then
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./pidpath;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall -lkvm -static; ./pidpath;
elif [ $(uname) = "SunOS" ]; then
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath -std=c++17 -Wall -static-libgcc -lproc; ./pidpath;
else
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.exe -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./pidpath.exe;
fi
