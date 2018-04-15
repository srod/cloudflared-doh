FROM alpine

LABEL image="srod/cloudflared-doh"
LABEL maintainer="srodolphe@gmail.com"
LABEL url="https://www.github.com/srod/cloudflared-doh"

RUN apk --update add --no-cache coreutils wget bash tar && \
    mkdir /opt && \
    wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz && \
    tar -xzf cloudflared-stable-linux-amd64.tgz -C /opt/ && rm cloudflared-stable-linux-amd64.tgz

#RUN apt-get update && \
#    apt-get install -y wget cron && \
#    wget -O- https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz \
#    | tar xvz && \
#    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

#COPY cron-cloudflared /etc/cron.d/cron-cloudflared
#RUN crontab /etc/cron.d/cron-cloudflared
RUN echo '0 2 * * * /opt/cloudflared update >>/var/log/cron.log 2>&1' > /etc/crontabs/root

COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

RUN ls /opt/

EXPOSE 53 53/udp

CMD ["/opt/start.sh"]
