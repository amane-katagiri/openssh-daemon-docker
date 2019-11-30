# openssh-daemon-docker

## Run OpenSSH SSH daemon with default host keys

```
docker run --rm -p 22222:22 -e PASSWORD="mysecretpassword" amane/sshd
```

## Run OpenSSH SSH daemon with your host keys

```
mkdir -p ./etc/ssh
ssh-keygen -A -f .
docker run --rm -p 22222:22 -v "$PWD"/etc/ssh:/host_keys:ro -e PASSWORD="mysecretpassword" amane/sshd
```

You can communicate with OpenSSH SSH daemon by `ssh -p 22222 root@localhost`.
