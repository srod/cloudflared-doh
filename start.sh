#!/bin/bash -e

# Start crontab
cron -f &

# Update Cloudflared
/cloudflared update

# Run supervisord
/usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf
