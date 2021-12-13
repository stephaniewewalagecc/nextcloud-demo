#cloud-config
package_update: true
package_upgrade: true
package_reboot_if_required: true
packages:
  - docker-ce
  - docker-ce-cli
  - containerd.io
runcmd:
  - docker pull linuxserver/nextcloud
  - docker run -d \
    --name=nextcloud \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=NZ \
    -p 443:443 \
    -v /path/to/appdata:/config \
    -v /path/to/data:/data \
    --restart unless-stopped \
    linuxserver/nextcloud
    touch /deploy-complete
apt:
  sources:
    docker:
      source: deb https://download.docker.com/linux/ubuntu $RELEASE stable
      keyid: 9dc858229fc7dd38854ae2d88d81803c0ebfcd88

