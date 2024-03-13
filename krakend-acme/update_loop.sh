#!/bin/sh
while true
do	
  if ! [ -f /root/.acme.sh/SI.krakend_ecc/SI.krakend.cer  -a  -f /root/.acme.sh/SI.krakend_ecc/SI.krakend.key ]
  then
    rm -rf /root/.acme.sh/SI.krakend_ecc/
    /root/.acme.sh/acme.sh --force --issue --standalone -d SI.krakend --server https://SI.ca/acme/acme/directory --ca-bundle $(step path)/certs/root_ca.crt
  else
    /root/.acme.sh/acme.sh --issue --standalone -d SI.krakend --server https://SI.ca/acme/acme/directory --ca-bundle $(step path)/certs/root_ca.crt
  fi
  sleep 7200
done

