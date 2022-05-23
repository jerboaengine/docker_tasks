FROM ubuntu:18.04

WORKDIR /build

COPY build.sh .

RUN apt update && apt install -y git
RUN apt -y install make
RUN apt -y install m4
RUN apt -y install ocaml
RUN apt -y install opam

RUN opam init

RUN opam depext conf-gmp.1
RUN opam depext conf-zlib.1
RUN opam depext conf-openssl.1

RUN opam install lwt
RUN opam install lwt_ssl
RUN opam install cryptokit
RUN opam install lwt_log
RUN opam install ocaml-protoc
RUN opam install cmdliner
RUN opam install dune

RUN git clone https://github.com/openvstorage/kinetic-ocaml-client.git

CMD [ "sh", "build.sh"]