#!/bash

#########################################################################
#  requires all isos be put in the same directory as the script
#  call smbpasswd installer after done.


adduser --disabled-password --gecos "" installer
usermod --password installer installer

cp *.iso -v /mnt

apt-get install p7zip-full
apt-get install samba syslinux pxelinux tftpd-hpa isc-dhcp-server

smbpasswd

cp smb.conf /etc/samba/
cp dhcpd.conf /etc/dhcp
cp isc-dhcp-server /etc/default
cp tftpd-hpa /etc/default
cp -rv tftpboot /var/lib

mkdir /mnt/sambashares
cd /mnt/sambashares

mkdir win8_32
mkdir win10_32
mkdir win7_32

mkdir win8_64
mkdir win10_64
mkdir win7_64




7z x /mnt/win7-32.iso -o/mnt/win7_32
7z x /mnt/win8-32.iso -o/mnt/win8_32
7z x /mnt/win10-32.iso -o/mnt/win10_32

7z x /mnt/win7-64.iso -o/mnt/win7_64
7z x /mnt/win8-64.iso -o/mnt/win8_64
7z x /mnt/win10-64.iso -o/mnt/win10_64







