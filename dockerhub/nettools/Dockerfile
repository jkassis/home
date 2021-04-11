FROM centos

RUN chmod 4755 /bin/su 
RUN echo "root:Docker!" | chpasswd
RUN yum install -y git rsync bash openssh-server openssh-clients less curl wget gcc make nmap bind-utils openssl curl telnet nodejs npm net-tools lsof mtr rsync strace traceroute unzip zip xfsdump python3

RUN cd /tmp
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN npm install -g http-server
WORKDIR ~
CMD http-server -p 8555

