#!/bin/bash -e

# Start crontab
cron -f &

/usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf
