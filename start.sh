#!/bin/bash -e

# Start crontab
cron -f &

# Start cloudflared
/cloudflared proxy-dns \
    --address 0.0.0.0 \
    --upstream https://1.1.1.1/dns-query \
    --upstream https://1.0.0.1/dns-query
