#!/usr/bin/bash

echo Regenerating SSH host keys.
for c in rsa ecdsa ed25519 ; do
  rm -v /etc/ssh/ssh_host_"$c"_key
  ssh-keygen -N "" -t "$c" -f /etc/ssh/ssh_host_"$c"_key
done

echo Starting SSHd.
exec /usr/sbin/sshd -D
