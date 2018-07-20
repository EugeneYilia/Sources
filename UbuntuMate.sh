rm /etc/apt/sources.list
cat > /etc/apt/sources.list << END_TEXT
deb http://ports.ubuntu.com/ xenial main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial main restricted universe multiverse
deb http://ports.ubuntu.com/ xenial-updates main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ xenial-security main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial-security main restricted universe multiverse
deb http://ports.ubuntu.com/ xenial-backports main restricted universe multiverse
deb-src http://ports.ubuntu.com/ xenial-backports main restricted universe multiverse
END_TEXT
apt update && apt upgrade
apt install vim -y
apt install openssh-server -y
service sshd start
apt install fish
chsh -s /usr/bin/fish
curl -L https://get.oh-my.fish | fish
omf install https://github.com/amio/omf-theme-eden
