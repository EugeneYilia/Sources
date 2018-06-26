su
cd /etc/apt
rm sources.list
echo "deb http://ports.ubuntu.com/ xenial main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial main restricted universe multiverse
deb http://ports.ubuntu.com/ xenial-updates main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ xenial-security main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial-security main restricted universe multiverse
deb http://ports.ubuntu.com/ xenial-backports main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial-backports main restricted universe multiverse" >> sources.list
apt update && apt upgrade
apt install vim -y
