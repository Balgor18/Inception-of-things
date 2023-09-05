#!/bin/bash

sh -c -e "echo '127.0.0.1 app1.com' >> /etc/hosts";
sh -c -e "echo '127.0.0.1 app2.com' >> /etc/hosts";
sh -c -e "echo '127.0.0.1 app3.com' >> /etc/hosts";

systemctl restart systemd-resolved
