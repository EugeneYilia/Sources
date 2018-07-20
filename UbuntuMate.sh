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
apt install tightvncserver
cat > /etc/init.d/tightvncserver << END_TEXT
#!/bin/sh
### BEGIN INIT INFO
# Provides:          tightvncserver
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/stop tightvncserver
### END INIT INFO

# More details see:
# http://www.penguintutor.com/linux/tightvnc

### Customize this entry
# Set the USER variable to the name of the user to start tightvncserver under
export USER='pi'
### End customization required

eval cd ~$USER

case "$1" in
  start)
    # 启动命令行。此处自定义分辨率、控制台号码或其它参数。
    su $USER -c '/usr/bin/tightvncserver -depth 16 -geometry 800x600 :1'
    echo "Starting TightVNC server for $USER "
    ;;
  stop)
    # 终止命令行。此处控制台号码与启动一致。
    su $USER -c '/usr/bin/tightvncserver -kill :1'
    echo "Tightvncserver stopped"
    ;;
  *)
    echo "Usage: /etc/init.d/tightvncserver {start|stop}"
    exit 1
    ;;
esac
exit 0
END_TEXT
sudo chmod 755 /etc/init.d/tightvncserver
sudo update-rc.d tightvncserver defaults
