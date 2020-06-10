FROM nervos/ckb-riscv-gnu-toolchain:bionic
LABEL maintainer="Nervos Core Dev <dev@nervos.org>"

ADD https://nim-lang.org/download/nim-1.2.0-linux_x64.tar.xz /opt/nim.tar.xz
RUN mkdir -pv /opt/workdir && \
 tar xvf /opt/nim.tar.xz -C /opt/workdir/ && \
 cd /opt/workdir/nim-* && sh ./install.sh /usr/bin && \
 cp -v bin/* /usr/bin/ && \
 rm -rf /opt/nim.tar.xz /opt/workdir

#ENTRYPOINT ["/usr/bin/nim"]
