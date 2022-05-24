FROM ubuntu:18.04

WORKDIR /build

COPY build.sh .

RUN apt update && apt install -y git
RUN apt -y install libtool autoconf automake build-essential
RUN apt -y install ibverbs-utils rdmacm-utils infiniband-diags perftest
RUN apt -y install librdmacm-dev libibverbs-dev numactl libnuma-dev libaio-dev libevent-dev

RUN apt -y install lsb-release
RUN apt -y install devscripts
RUN apt -y install debhelper
RUN apt -y install debconf
RUN apt -y install lintian
RUN apt -y install pkg-config

RUN git clone https://github.com/openvstorage/accelio accelio

COPY directive_writing_between_1_and_11_bytes.patch ./accelio/
COPY debian_build_package_fix.patch ./accelio/
COPY fix-misleading-indentation-error.patch ./accelio/
COPY remove-install-exec-hook.patch ./accelio/

RUN rm -r ./accelio/debian/patches

RUN cd ./accelio/ && git apply ./fix-misleading-indentation-error.patch
RUN cd ./accelio/ && git apply ./remove-install-exec-hook.patch
RUN cd ./accelio/ && git apply ./directive_writing_between_1_and_11_bytes.patch
RUN cd ./accelio/ && git apply ./debian_build_package_fix.patch

RUN cd ./accelio/ && git config --global user.email "you@example.com"
RUN cd ./accelio/ && git config --global user.name "Your Name"
RUN cd ./accelio/ && git commit -am "commit message"

CMD [ "sh", "build.sh"]