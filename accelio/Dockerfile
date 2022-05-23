FROM ubuntu:18.04

WORKDIR /build

COPY build.sh .

RUN apt update && apt install -y git
RUN apt -y install libtool autoconf automake build-essential
RUN apt -y install ibverbs-utils rdmacm-utils infiniband-diags perftest
RUN apt -y install librdmacm-dev libibverbs-dev numactl libnuma-dev libaio-dev libevent-dev

RUN git clone https://github.com/openvstorage/accelio accelio-1.5

COPY directive_writing_between_1_and_11_bytes.patch ./accelio-1.5/

RUN cd ./accelio-1.5/ && git apply ./debian/patches/fix-misleading-indentation-error.patch
RUN cd ./accelio-1.5/ && git apply ./directive_writing_between_1_and_11_bytes.patch

CMD [ "sh", "build.sh"]