#!/bin/bash

# Install dependencies (debbootstrap)
sudo apt-get install debootstrap curl

# Fetch the latest Kali debootstrap script from git
curl "http://git.kali.org/gitweb/?p=packages/debootstrap.git;a=blob_plain;f=scripts/kali;h=50d7ef5b4e9e905cc6da8655416cdf3ef559911e;hb=refs/heads/kali/master" > kali-debootstrap &&\
sudo debootstrap kali ./kali-root http://http.kali.org/kali ./kali-debootstrap &&\
sudo tar -C kali-root -c . | sudo docker import - kalilinux/kali &&\
sudo rm -rf ./kali-root &&\
docker run -t -i kalilinux/kali cat /etc/debian_version &&\
echo "Build OK" || echo "Build failed!"
