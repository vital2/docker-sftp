FROM debian:stretch
MAINTAINER Vital Admin [vital.nyu@gmail.com]

# Steps done in one RUN layer:
# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN apt-get update && \
    apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY sshd_config /etc/ssh/sshd_config
COPY create_user.sh /home/
COPY mod_user_password.sh /home/
COPY rm_user.sh /home/
COPY entrypoint /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
