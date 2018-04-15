FROM debian

LABEL image="srod/cloudflared-doh"
LABEL maintainer="srodolphe@gmail.com"
LABEL url="https://www.github.com/srod/cloudflared-doh"

RUN apt-get update && \
    apt-get install -y wget cron && \
    wget -O- https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz \
    | tar xvz && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

COPY cron-cloudflared /etc/cron.d/cron-cloudflared
RUN crontab /etc/cron.d/cron-cloudflared

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 53 53/udp

CMD ["/start.sh"]
