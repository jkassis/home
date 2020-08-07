FROM centos

RUN chmod 4755 /bin/su 
RUN echo "root:Docker!" | chpasswd
RUN yum install -y git rsync bash openssh-server openssh-clients less curl wget gcc make nmap bind-utils openssl curl telnet nodejs npm net-tools lsof mtr rsync strace traceroute unzip zip xfsdump
RUN npm install -g http-server
CMD http-server -p 8555

