FROM alpine
MAINTAINER Amane Katagiri
EXPOSE 22
RUN apk add --update --no-cache openssh \
  && ssh-keygen -A \
  && mkdir -p /host_keys \
  && find /etc/ssh/ -type f -name "ssh_host_*" | xargs -IXXX mv XXX /host_keys/ \
  && find /host_keys/ -type f | xargs -IXXX ln -s XXX /etc/ssh/ \
  && sed -i 's/#\?PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && mkdir -p /data
COPY run.sh /run.sh
CMD ["/run.sh"]
