#!/bin/sh
step ca bootstrap --ca-url=https://SI.ca --fingerprint=$(cat /mnt/defaults.json | jq '.fingerprint' -r) --install
if ! [ -f /root/.acme.sh/SI.krakend_ecc/SI.krakend.cer  -a  -f /root/.acme.sh/SI.krakend_ecc/SI.krakend.key ]
then
  rm -rf /root/.acme.sh/SI.krakend_ecc/
  /root/.acme.sh/acme.sh --force --issue --standalone -d SI.krakend --server https://SI.ca/acme/acme/directory --ca-bundle $(step path)/certs/root_ca.crt
else
  /root/.acme.sh/acme.sh --issue --standalone -d SI.krakend --server https://SI.ca/acme/acme/directory --ca-bundle $(step path)/certs/root_ca.crt
fi
update_loop.sh &
/usr/bin/krakend run --config /etc/krakend.json

