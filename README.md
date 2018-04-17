# Docker Cloudflared DNS-Over-HTTPS

Use Cloudflare DNS (1.1.1.1, 1.0.0.1) with DNS-Over-HTTPS

# Start

```bash
docker run -d \
  --name Cloudflared \
  -p 54:53/tcp -p 54:53/udp \
  srod/cloudflared-doh
```

# Update

A CRON job is implemented to update cloudflared on a daily basis at 2am

# Resources

* https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/
* https://scotthelme.co.uk/securing-dns-across-all-of-my-devices-with-pihole-dns-over-https-1-1-1-1/
* https://bendews.com/posts/implement-dns-over-https/
* https://forum.synology.com/enu/viewtopic.php?f=265&t=141425
* https://forums.docker.com/t/running-cronjob-in-debian-jessie-container/17527/4
