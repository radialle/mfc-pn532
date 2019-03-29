FROM debian:latest

RUN apt-get update && \
    apt-get install -y gcc make pkg-config autoconf

WORKDIR /root

COPY libnfc-1.5.1.tar.gz .
COPY mfcuk-65.tar.gz .
COPY mfoc.tar.gz .

RUN tar -xvf libnfc-1.5.1.tar.gz && \
    tar -xvf mfcuk-65.tar.gz && \
    tar -xvf mfoc.tar.gz && \
    rm *.tar.gz

WORKDIR /root/libnfc-1.5.1

RUN ./configure --prefix=/usr --with-drivers=pn532_uart --sysconfdir=/etc --enable-serial-autoprobe && \
    make && make install && mkdir -p /etc/nfc

COPY libnfc.conf /etc/nfc/libnfc.conf

WORKDIR /root/mfcuk-65

RUN autoreconf -is && ./configure && make && \
    cp src/mfcuk /usr/local/bin/ && cp -r src/data /usr/local/bin/data

WORKDIR /root/mfoc

RUN autoreconf -is && ./configure && make && make install

WORKDIR /root

RUN rm -rf libnfc-1.5.1 mfcuk-65 mfoc
