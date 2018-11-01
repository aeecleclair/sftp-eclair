FROM debian:latest

MAINTAINER eclair@ec-lyon.fr

ENV SFTP_USER = sftp_user\
    SFTP_PWD = sftp_pwd \
    SFTP_HOME = /home/sftp_user/

RUN apt-get update && \
    apt-get -y install openssh-server && \
    mkdir -p /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup sftp

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint /

EXPOSE 22

ENTRYPOINT [ "/entrypoint" ]
