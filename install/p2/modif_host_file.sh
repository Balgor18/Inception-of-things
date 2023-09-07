#!/bin/bash

sh -c -e "echo '192.168.56.110 app1.com' >> /etc/hosts";
sh -c -e "echo '192.168.56.110 app2.com' >> /etc/hosts";
sh -c -e "echo '192.168.56.110 app3.com' >> /etc/hosts";

systemctl restart systemd-resolved
