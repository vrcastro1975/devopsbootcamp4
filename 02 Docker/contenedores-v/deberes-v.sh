#Deberes:
# 1. Crea una nueva red de tipo bridge/nat llamada lemoncode
docker network create lemoncode

6f01abb70c13b17bbbff8d3a69bfea1bd0b9ec0453e0128a4aff3ffbbe454a0c

docker network ls
NETWORK ID     NAME        DRIVER    SCOPE
a8cadd6dc442   bridge      bridge    local
d57b659fe8fc   host        host      local
6f01abb70c13   lemoncode   bridge    local
f46e16d4334b   none        null      local


# 2. Crea dos contenedores dentro de la red que acabas de crear, uno de ellos con la imagen nginx
docker run -dit --name ubuntu-container --network lemoncode ubuntu bash

Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
aece8493d397: Pull complete 
Digest: sha256:2b7412e6465c3c7fc5bb21d3e6f1917c167358449fecac8176c6e496e5c1f05f
Status: Downloaded newer image for ubuntu:latest
a6b9bd6a08cfabc4124da32b3d4c8066a34d1a67a16ab551f9ebd89132bd7fbc

docker run -d --name nginx-container --network lemoncode nginx

Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
578acb154839: Pull complete 
e398db710407: Pull complete 
85c41ebe6d66: Pull complete 
7170a263b582: Pull complete 
8f28d06e2e2e: Pull complete 
6f837de2f887: Pull complete 
c1dfc7e1671e: Pull complete 
Digest: sha256:86e53c4c16a6a276b204b0fd3a8143d86547c967dc8258b3d47c3a21bb68d3c6
Status: Downloaded newer image for nginx:latest
7ac6b8b0f50a937de7f827e613c41fef94da23225593fce79eaf8d1a5e8d3062

# 3. Con cURL y el nombre del contenedor solicita la web que se está ejecutando con Nginx
docker attach ubuntu-container

root@a6b9bd6a08cf:/# 


apt update && apt upgrade && apt -y install curl

Get:1 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [109 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]
Get:5 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]            
Get:6 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1194 kB] 
Get:7 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]
Get:9 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1792 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [1420 kB] 
Get:11 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1466 kB]        
Get:12 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1274 kB]    
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [49.8 kB]   
Get:14 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [78.3 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [32.6 kB]
Get:16 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1008 kB]
Get:17 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [1392 kB]
Get:18 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [44.0 kB]
Fetched 28.3 MB in 4s (7244 kB/s)                           
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
7 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
The following packages will be upgraded:
  libgssapi-krb5-2 libk5crypto3 libkrb5-3 libkrb5support0 libssl3 libsystemd0 libudev1
7 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 2916 kB of archives.
After this operation, 4096 B of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsystemd0 amd64 249.11-0ubuntu3.11 [318 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libk5crypto3 amd64 1.19.2-2ubuntu0.3 [86.3 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libkrb5support0 amd64 1.19.2-2ubuntu0.3 [32.2 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libkrb5-3 amd64 1.19.2-2ubuntu0.3 [356 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgssapi-krb5-2 amd64 1.19.2-2ubuntu0.3 [144 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssl3 amd64 3.0.2-0ubuntu1.12 [1901 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudev1 amd64 249.11-0ubuntu3.11 [78.0 kB]
Fetched 2916 kB in 1s (2535 kB/s)   
debconf: delaying package configuration, since apt-utils is not installed
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../libsystemd0_249.11-0ubuntu3.11_amd64.deb ...
Unpacking libsystemd0:amd64 (249.11-0ubuntu3.11) over (249.11-0ubuntu3.10) ...
Setting up libsystemd0:amd64 (249.11-0ubuntu3.11) ...
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../libk5crypto3_1.19.2-2ubuntu0.3_amd64.deb ...
Unpacking libk5crypto3:amd64 (1.19.2-2ubuntu0.3) over (1.19.2-2ubuntu0.2) ...
Setting up libk5crypto3:amd64 (1.19.2-2ubuntu0.3) ...
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../libkrb5support0_1.19.2-2ubuntu0.3_amd64.deb ...
Unpacking libkrb5support0:amd64 (1.19.2-2ubuntu0.3) over (1.19.2-2ubuntu0.2) ...
Setting up libkrb5support0:amd64 (1.19.2-2ubuntu0.3) ...
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../libkrb5-3_1.19.2-2ubuntu0.3_amd64.deb ...
Unpacking libkrb5-3:amd64 (1.19.2-2ubuntu0.3) over (1.19.2-2ubuntu0.2) ...
Setting up libkrb5-3:amd64 (1.19.2-2ubuntu0.3) ...
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../libgssapi-krb5-2_1.19.2-2ubuntu0.3_amd64.deb ...
Unpacking libgssapi-krb5-2:amd64 (1.19.2-2ubuntu0.3) over (1.19.2-2ubuntu0.2) ...
Setting up libgssapi-krb5-2:amd64 (1.19.2-2ubuntu0.3) ...
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../libssl3_3.0.2-0ubuntu1.12_amd64.deb ...
Unpacking libssl3:amd64 (3.0.2-0ubuntu1.12) over (3.0.2-0ubuntu1.10) ...
Setting up libssl3:amd64 (3.0.2-0ubuntu1.12) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.34.0 /usr/local/share/perl/5.34.0 /usr/lib/x86_64-linux-gnu/perl5/5.34 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.34 /usr/share/perl/5.34 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../libudev1_249.11-0ubuntu3.11_amd64.deb ...
Unpacking libudev1:amd64 (249.11-0ubuntu3.11) over (249.11-0ubuntu3.10) ...
Setting up libudev1:amd64 (249.11-0ubuntu3.11) ...
Processing triggers for libc-bin (2.35-0ubuntu3.4) ...
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  ca-certificates libbrotli1 libcurl4 libldap-2.5-0 libldap-common libnghttp2-14 libpsl5 librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libssh-4 openssl
  publicsuffix
Suggested packages:
  libsasl2-modules-gssapi-mit | libsasl2-modules-gssapi-heimdal libsasl2-modules-ldap libsasl2-modules-otp libsasl2-modules-sql
The following NEW packages will be installed:
  ca-certificates curl libbrotli1 libcurl4 libldap-2.5-0 libldap-common libnghttp2-14 libpsl5 librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libssh-4
  openssl publicsuffix
0 upgraded, 15 newly installed, 0 to remove and 0 not upgraded.
Need to get 2986 kB of archives.
After this operation, 7124 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 openssl amd64 3.0.2-0ubuntu1.12 [1182 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ca-certificates all 20230311ubuntu0.22.04.1 [155 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy/main amd64 libnghttp2-14 amd64 1.43.0-1build3 [76.3 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy/main amd64 libpsl5 amd64 0.21.0-1.2build2 [58.4 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy/main amd64 publicsuffix all 20211207.1025-1 [129 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/main amd64 libbrotli1 amd64 1.0.9-2build6 [315 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsasl2-modules-db amd64 2.1.27+dfsg2-3ubuntu1.2 [20.5 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsasl2-2 amd64 2.1.27+dfsg2-3ubuntu1.2 [53.8 kB]
Get:9 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-2.5-0 amd64 2.5.16+dfsg-0ubuntu0.22.04.1 [183 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy/main amd64 librtmp1 amd64 2.4+20151223.gitfa8646d.1-2build4 [58.2 kB]
Get:11 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssh-4 amd64 0.9.6-2ubuntu0.22.04.1 [185 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.14 [290 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.14 [194 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-common all 2.5.16+dfsg-0ubuntu0.22.04.1 [15.8 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsasl2-modules amd64 2.1.27+dfsg2-3ubuntu1.2 [68.8 kB]
Fetched 2986 kB in 1s (2326 kB/s)            
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package openssl.
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../00-openssl_3.0.2-0ubuntu1.12_amd64.deb ...
Unpacking openssl (3.0.2-0ubuntu1.12) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../01-ca-certificates_20230311ubuntu0.22.04.1_all.deb ...
Unpacking ca-certificates (20230311ubuntu0.22.04.1) ...
Selecting previously unselected package libnghttp2-14:amd64.
Preparing to unpack .../02-libnghttp2-14_1.43.0-1build3_amd64.deb ...
Unpacking libnghttp2-14:amd64 (1.43.0-1build3) ...
Selecting previously unselected package libpsl5:amd64.
Preparing to unpack .../03-libpsl5_0.21.0-1.2build2_amd64.deb ...
Unpacking libpsl5:amd64 (0.21.0-1.2build2) ...
Selecting previously unselected package publicsuffix.
Preparing to unpack .../04-publicsuffix_20211207.1025-1_all.deb ...
Unpacking publicsuffix (20211207.1025-1) ...
Selecting previously unselected package libbrotli1:amd64.
Preparing to unpack .../05-libbrotli1_1.0.9-2build6_amd64.deb ...
Unpacking libbrotli1:amd64 (1.0.9-2build6) ...
Selecting previously unselected package libsasl2-modules-db:amd64.
Preparing to unpack .../06-libsasl2-modules-db_2.1.27+dfsg2-3ubuntu1.2_amd64.deb ...
Unpacking libsasl2-modules-db:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Selecting previously unselected package libsasl2-2:amd64.
Preparing to unpack .../07-libsasl2-2_2.1.27+dfsg2-3ubuntu1.2_amd64.deb ...
Unpacking libsasl2-2:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Selecting previously unselected package libldap-2.5-0:amd64.
Preparing to unpack .../08-libldap-2.5-0_2.5.16+dfsg-0ubuntu0.22.04.1_amd64.deb ...
Unpacking libldap-2.5-0:amd64 (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Selecting previously unselected package librtmp1:amd64.
Preparing to unpack .../09-librtmp1_2.4+20151223.gitfa8646d.1-2build4_amd64.deb ...
Unpacking librtmp1:amd64 (2.4+20151223.gitfa8646d.1-2build4) ...
Selecting previously unselected package libssh-4:amd64.
Preparing to unpack .../10-libssh-4_0.9.6-2ubuntu0.22.04.1_amd64.deb ...
Unpacking libssh-4:amd64 (0.9.6-2ubuntu0.22.04.1) ...
Selecting previously unselected package libcurl4:amd64.
Preparing to unpack .../11-libcurl4_7.81.0-1ubuntu1.14_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.14) ...
Selecting previously unselected package curl.
Preparing to unpack .../12-curl_7.81.0-1ubuntu1.14_amd64.deb ...
Unpacking curl (7.81.0-1ubuntu1.14) ...
Selecting previously unselected package libldap-common.
Preparing to unpack .../13-libldap-common_2.5.16+dfsg-0ubuntu0.22.04.1_all.deb ...
Unpacking libldap-common (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Selecting previously unselected package libsasl2-modules:amd64.
Preparing to unpack .../14-libsasl2-modules_2.1.27+dfsg2-3ubuntu1.2_amd64.deb ...
Unpacking libsasl2-modules:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Setting up libpsl5:amd64 (0.21.0-1.2build2) ...
Setting up libbrotli1:amd64 (1.0.9-2build6) ...
Setting up libsasl2-modules:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Setting up libnghttp2-14:amd64 (1.43.0-1build3) ...
Setting up libldap-common (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Setting up libsasl2-modules-db:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Setting up librtmp1:amd64 (2.4+20151223.gitfa8646d.1-2build4) ...
Setting up libsasl2-2:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Setting up libssh-4:amd64 (0.9.6-2ubuntu0.22.04.1) ...
Setting up openssl (3.0.2-0ubuntu1.12) ...
Setting up publicsuffix (20211207.1025-1) ...
Setting up libldap-2.5-0:amd64 (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Setting up ca-certificates (20230311ubuntu0.22.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.34.0 /usr/local/share/perl/5.34.0 /usr/lib/x86_64-linux-gnu/perl5/5.34 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.34 /usr/share/perl/5.34 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Updating certificates in /etc/ssl/certs...
137 added, 0 removed; done.
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.14) ...
Setting up curl (7.81.0-1ubuntu1.14) ...
Processing triggers for libc-bin (2.35-0ubuntu3.4) ...
Processing triggers for ca-certificates (20230311ubuntu0.22.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.


curl http://nginx-container

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
root@a6b9bd6a08cf:/# 


exit


# 4. Borrar todo y dejar el sistema limpio para otros trabajos

docker container stop nginx-container

nginx-container


docker container rm nginx-container

nginx-container


docker network rm $(docker network ls)

Error response from daemon: network NETWORK not found
Error response from daemon: network ID not found
Error response from daemon: network NAME not found
Error response from daemon: network DRIVER not found
Error response from daemon: network SCOPE not found
Error response from daemon: bridge is a pre-defined network and cannot be removed
Error response from daemon: bridge is a pre-defined network and cannot be removed
Error response from daemon: bridge is a pre-defined network and cannot be removed
Error response from daemon: network local not found
Error response from daemon: host is a pre-defined network and cannot be removed
Error response from daemon: host is a pre-defined network and cannot be removed
Error response from daemon: host is a pre-defined network and cannot be removed
Error response from daemon: network local not found
6f01abb70c13
Error response from daemon: network lemoncode not found
Error response from daemon: bridge is a pre-defined network and cannot be removed
Error response from daemon: network local not found
Error response from daemon: none is a pre-defined network and cannot be removed
Error response from daemon: none is a pre-defined network and cannot be removed
Error response from daemon: network null not found
Error response from daemon: network local not found
#(No borra las que trae por defecto)

docker image rm -f $(docker image ls -aq)

Untagged: ubuntu:latest
Untagged: ubuntu@sha256:2b7412e6465c3c7fc5bb21d3e6f1917c167358449fecac8176c6e496e5c1f05f
Deleted: sha256:e4c58958181a5925816faa528ce959e487632f4cfd192f8132f71b32df2744b4
Untagged: yazcunaga/galleryapp:latest
Untagged: yazcunaga/galleryapp@sha256:e6f3cfc5b058d22b8e0c97f2c903d17d4946f4bd342bd83b7051e036c0bc13c0
Deleted: sha256:5d421e48e6406920d225d0f9b3d48522f2a8908ae2d6f5eb42e250358176dd96
#Ya tenemos el sistema limpio y preparado para el siguiente ejercicio