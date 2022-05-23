#!/bin/bash
eval $(opam config env)
cd kinetic-ocaml-client
make
make install