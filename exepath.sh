#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall -arch arm64 -arch x86_64; ./exepath.out;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepath.out;
  else
    clang++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall; ./exepath.out;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall -static; ./exepath.out;
elif [ $(uname) = "DragonFly" ]; then
  g++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepath.out;
elif [ $(uname) = "NetBSD" ]; then
  g++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepath.out;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall -lkvm -static; ./exepath.out;
elif [ $(uname) = "SunOS" ]; then
  g++ exepath/exepath.cpp exepath.cpp -o exepath.out -std=c++17 -Wall -static-libgcc; ./exepath.out;
else
  g++ exepath/exepath.cpp exepath.cpp -o exepath.out.exe -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./exepath.out.exe;
fi
