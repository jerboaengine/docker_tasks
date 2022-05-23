#!/bin/bash
cd accelio-1.5
./autogen.sh
./configure
make
./make-deb.sh