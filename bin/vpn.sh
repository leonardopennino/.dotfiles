
vpnstart() {
     password=$(op read "op://Private/ETHZ RADIUS/newPassword")
     echo $password | sudo openconnect \
        --background \
        --pid-file="$HOME/.openconnect.pid" \
        --user="lpennino@student-net.ethz.ch" \
        --authgroup="student-net"\
		-b sslvpn.ethz.ch
}

vpnstop() {
    if [[ -f "$HOME/.openconnect.pid" ]]; then
        sudo kill -2 $(cat "$HOME/.openconnect.pid") && rm -f "$HOME/.openconnect.pid"
    else
        echo "openconnect pid file does not exist, probably not running"
    fi
}
