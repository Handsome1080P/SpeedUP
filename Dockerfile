FROM debian:bookworm-slim

LABEL maintainer="your_name"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    iptables \
    supervisor \
    iproute2 \
    iputils-ping \
    net-tools \
    curl \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor /etc/supervisor/conf.d /var/run

COPY udp2raw_amd64_hw_aes /usr/local/bin/udp2raw
COPY tinyvpn /usr/local/bin/tinyvpn
COPY start_udp2raw.sh /usr/local/bin/start_udp2raw.sh
COPY start_tinyvpn.sh /usr/local/bin/start_tinyvpn.sh
COPY VPN.conf /etc/supervisor/conf.d/VPN.conf

RUN chmod +x /usr/local/bin/udp2raw \
    && chmod +x /usr/local/bin/tinyvpn \
    && chmod +x /usr/local/bin/start_udp2raw.sh \
    && chmod +x /usr/local/bin/start_tinyvpn.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/VPN.conf"]
