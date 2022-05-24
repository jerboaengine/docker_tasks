#!/bin/bash
cd accelio
./autogen.sh
./configure
make
make install
cd accelio
./make-deb.sh
