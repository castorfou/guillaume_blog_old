---
title: "Git - using SOCKS5 proxy"
description: to connect to github behind local firewall
toc: true
comments: true
layout: post
categories: [git]
image: https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png
---



## setup socks5 server

using [dante](https://community.hetzner.com/tutorials/install-and-configure-danted-proxy-socks5) server

**Installation**

```bash
sudo apt-get install dante-server
```



**Conf file**

```bash
sudo nano /etc/danted.conf

logoutput: stderr
internal: enp3s0 port = 1080
external: enp3s0
socksmethod: none
clientmethod: none
user.privileged: proxy
user.unprivileged: nobody
user.libwrap: nobody
client pass {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: error connect disconnect
}
client block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}
socks pass {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: error connect disconnect
}
socks block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}
```



**Start and monitor usage**

```bash
sudo service danted restart
tail -f /var/log/syslog
```



## Git setup 

```bash
$ cat .ssh/config
Host github.com
IdentityFile ~/.ssh/id_rsa_gmail
ProxyCommand /bin/nc -X 5 -x 192.168.50.202:1080 %h %p
```

