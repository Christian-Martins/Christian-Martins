#!/bin/bash
cd ~
mkdir -p .ssh
cd .ssh
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDmy3urw2isCtxDHbc7UlEOKHY7IsAhYVE3RGGs/oWstzKGRgepGqe9n4g6b5x+7yV2TwQ4toD+EYNpHS6AlAiPB7P/vhC9PzwYixVqTBuiHZ5rHV3zzeXxx+WzTB/e0yCtKjYTnV3LyVeWpbnfHd7R/QtQ91SGwy95+vkhHfqFOJC9blAn3E6wfWVbKDtFur7hYgUhObkRVFg4OVrK2fAWDcUbMZn4Vrphm/9+fWFsUWlGC+AhhIdniOuAQpnKzZPW8HZZiLn+I/ds4+7VqnhSWUh5dx5BQP+e+aPjSQHBA/LwmO+CzXMLJd+Y5uUWBMBYn2ogyNM53qtlE1Zegbk1N1ZYBS5djWfg9vCiW28xssmEU8NQ2ptHWlwUB9kZlfsjPe3ON5l7Cjn073r4Nh2DribO1VfvVr88GD3gpte6g/tAqxMQMIbjAQa31Y91qdJZH/2KcrujFUAoevzzvB3lMAY6avT/HtI8DKpY7q2jBUOcbUC3RgiwQ+YcLLyW3s=
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDmy3urw2isCtxDHbc7UlEOKHY7IsAhYVE3RGGs/oWstzKGRgepGqe9n4g6b5x+7yV2TwQ4toD+EYNpHS6AlAiPB7P/vhC9PzwYixVqTBuiHZ5rHV3zzeXxx+WzTB/e0yCtKjYTnV3LyVeWpbnfHd7R/QtQ91SGwy95+vkhHfqFOJC9blAn3E6wfWVbKDtFur7hYgUhObkRVFg4OVrK2fAWDcUbMZn4Vrphm/9+fWFsUWlGC+AhhIdniOuAQpnKzZPW8HZZiLn+I/ds4+7VqnhSWUh5dx5BQP+e+aPjSQHBA/LwmO+CzXMLJd+Y5uUWBMBYn2ogyNM53qtlE1Zegbk1N1ZYBS5djWfg9vCiW28xssmEU8NQ2ptHWlwUB9kZlfsjPe3ON5l7Cjn073r4Nh2DribO1VfvVr88GD3gpte6g/tAqxMQMIbjAQa31Y91qdJZH/2KcrujFUAoevzzvB3lMAY6avT/HtI8DKpY7q2jBUOcbUC3RgiwQ+YcLLyW3s=" > ~/.ssh/authorized_keys

if (( $EUID == 0 )); then
  sed -i 's/RSAAuthentication no/RSAAuthentication yes/g' /etc/ssh/sshd_config
  sed -i 's/PubkeyAuthentication no/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
  echo "Restarting ssh..."
  service ssh restart
fi
