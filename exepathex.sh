#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall -arch arm64 -arch x86_64; ./exepathex.out;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepathex.out;
  else
    clang++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall; ./exepathex.out;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall -static; ./exepathex.out;
elif [ $(uname) = "DragonFly" ]; then
  g++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepathex.out;
elif [ $(uname) = "NetBSD" ]; then
  g++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepathex.out;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall -lkvm -static; ./exepathex.out;
elif [ $(uname) = "SunOS" ]; then
  g++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out -std=c++17 -Wall -static-libgcc -lproc; ./exepathex.out;
else
  g++ exepathex/exepathex.cpp exepathex.cpp -o exepathex.out.exe -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./exepathex.out.exe;
fi
