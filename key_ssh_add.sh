#!/bin/bash
cd /root
mkdir .ssh
cd .ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDmy3urw2isCtxDHbc7UlEOKHY7IsAhYVE3RGGs/oWstzKGRgepGqe9n4g6b5x+7yV2TwQ4toD+EYNpHS6AlAiPB7P/vhC9PzwYixVqTBuiHZ5rHV3zzeXxx+WzTB/e0yCtKjYTnV3LyVeWpbnfHd7R/QtQ91SGwy95+vkhHfqFOJC9blAn3E6wfWVbKDtFur7hYgUhObkRVFg4OVrK2fAWDcUbMZn4Vrphm/9+fWFsUWlGC+AhhIdniOuAQpnKzZPW8HZZiLn+I/ds4+7VqnhSWUh5dx5BQP+e+aPjSQHBA/LwmO+CzXMLJd+Y5uUWBMBYn2ogyNM53qtlE1Zegbk1N1ZYBS5djWfg9vCiW28xssmEU8NQ2ptHWlwUB9kZlfsjPe3ON5l7Cjn073r4Nh2DribO1VfvVr88GD3gpte6g/tAqxMQMIbjAQa31Y91qdJZH/2KcrujFUAoevzzvB3lMAY6avT/HtI8DKpY7q2jBUOcbUC3RgiwQ+YcLLyW3s= enert@DESKTOP-92QG3FK" > /root/.ssh/authorized_keys
sed -i 's/RSAAuthentication no/RSAAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/PubkeyAuthentication no/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
service ssh restart
