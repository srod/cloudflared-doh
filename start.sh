#!/bin/bash -e

# Start crontab
crond -l 2 -f &

# Start cloudflared
/opt/cloudflared proxy-dns \
    --address 0.0.0.0 \
    --upstream https://1.1.1.1/dns-query \
    --upstream https://1.0.0.1/dns-query
