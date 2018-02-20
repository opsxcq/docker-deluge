FROM debian:9.2

LABEL maintainer "opsxcq@strm.sh"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    deluge-common deluged deluge-web deluge-console \
    wget curl \
    unzip unrar-free p7zip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

  RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin deluge && \
    mkdir /config /downloads /incomplete /autoadd && \
    chown deluge:deluge /config /downloads /incomplete /autoadd

USER deluge

EXPOSE 8112
EXPOSE 58846

VOLUME /config
VOLUME /downloads
VOLUME /autoadd
VOLUME /incomplete

COPY main.sh /
ENTRYPOINT ["/main.sh"]
CMD ["default"]

