#!/bin/bash
# Script fait pas Mario Cnockaert <3
apt install ipset -y; ipset create Cloudflare hash:net; for cf in $(curl https://www.cloudflare.com/ips-v4); do ipset add Cloudflare $cf; done && sudo iptables -A INPUT -p tcp -m set ! --match-set Cloudflare src -m multiport --dport http,https -j DROP; iptables-save;echo "Success";
