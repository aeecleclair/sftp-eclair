# SFTP Docker Image

A simple docker image to build containers with SFTP access for one user.

# Usage

The user has to be defined through environment variables:
- `SFTP_USER`: the name of the sftp_user
- `SFTP_PWD`: the password of the sftp_user
- `SFTP_HOME`: the home directory of the user, i.e. `/home/sftp_user/`

The user is chrooted to his home directory, so you can mount a volume on this directory to save uploaded files.

# Examples

## Simplest docker run example
To do

## Mount a volume
To do

## With Docker Compose

```
sftp_container:
    container_name: container_sftp
    image: sftp-eclair:latest
    restart: always
    volumes:
        - name_of_your_external_volume:/home/sftp_user
    networks:
      name_of_your_external_subnetwork:
        ipv4_address: <IPV4>   
    ports:
        - "<HOST-IP>:2222:22"      
    environment:
      - SFTP_USER=sftp_user
      - SFTP_PWD=pwd_sftp
      - SFTP_HOME=/home/sftp_user/
```

# How to log in to transfer files?

The OpenSSH server runs by default on port 22.
On the examples we are forwarding the container's port 22 to the host's port 2222. 
To log in, just type `sftp -P 2222 sftp_user@<HOST-IP>`.
