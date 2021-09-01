#!/bin/bash
# Script fait pas Mario Cnockaert <3
apt install ipset -y; ipset create Cloudflare hash:net; for cf in $(curl https://www.cloudflare.com/ips-v4); do ipset add Cloudflare $cf; done && sudo iptables -A INPUT -p tcp -m set ! --match-set Cloudflare src -m multiport --dport http,https -j DROP; iptables-save;echo "Success With IPTables & IPSet";
echo "set_real_ip_from 197.234.240.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 131.0.72.0/22;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 104.24.0.0/14;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 104.16.0.0/13;

set_real_ip_from 2c0f:f248::/32;
set_real_ip_from 2803:f800::/32;
set_real_ip_from 2606:4700::/32;
set_real_ip_from 2405:b500::/32;
set_real_ip_from 2405:8100::/32;
set_real_ip_from 2400:cb00::/32;
set_real_ip_from 2a06:98c0::/29;
    
real_ip_header CF-Connecting-IP;" >> /etc/nginx/conf.d/cloudflare

echo "include /etc/nginx/conf.d/cloudflare;" >> /etc/nginx/nginx.conf

systemctl restart nginx
echo "success to add Cloudflare ips in Nginx"
