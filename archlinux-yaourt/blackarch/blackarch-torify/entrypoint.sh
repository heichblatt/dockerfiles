#!/usr/bin/env bash

TOR_LOG=/var/log/tor
IP_ADDR_API="https://v4.ifconfig.co/"
trap "exit 1" INT

log() {
	echo "[+] $*"
}

log Preparing Tor start..
sudo touch ${TOR_LOG}
sudo chown tor: ${TOR_LOG}

log Config: ControlPort
sudo sed -i 's/\#ControlPort/ControlPort/g' /etc/tor/torrc

log Config: logging
echo "Log notice file ${TOR_LOG}" | sudo tee -a /etc/tor/torrc

log Starting Tor
sudo -u tor sh -c 'tor > /var/log/tor' &

RES=0
# https://git-tails.immerda.ch/tails/plain/config/chroot_local-includes/usr/local/lib/tails-shell-library/tor.sh
until [ ${RES} -eq 100 ] ; do
	log Bootstrapped ${RES}%, waiting.. ;
	RES=$(sudo grep -o "\[notice\] Bootstrapped [[:digit:]]\+%:" ${TOR_LOG} | \
			    tail -n1 | sed "s|\[notice\] Bootstrapped \([[:digit:]]\+\)%:|\1|")
	sleep 2s;
done

log Tor has started
log Testing connectivity
until [ ${#OUR_IP} -ge 5 ] ; do
	log Not fully connected yet, waiting..
	OUR_IP=$(timeout 30 torify curl --silent ${IP_ADDR_API})
	/usr/sbin/sleep 2s
done
log Info: Our new IP address: $OUR_IP 
log check.torproject.org says: $(torify curl --silent https://check.torproject.org | grep Congratulations | uniq )


if [ -z "$1" ] ; then
	log No command to run, tailing ${TOR_LOG}.
	sudo tail -f ${TOR_LOG}
else
	log Running: bash -c \"$*\"
	bash -c "$*"
fi
