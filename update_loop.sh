#!/bin/sh
while true
do	
  if ! [ -f /root/.acme.sh/SI.endpoint_ecc/SI.endpoint.cer  -a  -f /root/.acme.sh/SI.endpoint_ecc/SI.endpoint.key ]
  then
    rm -rf /root/.acme.sh/SI.endpoint_ecc/
    /root/.acme.sh/acme.sh --force --issue --standalone -d SI.endpoint --server https://SI.ca/acme/acme/directory --ca-bundle $(step path)/certs/root_ca.crt
  else
    /root/.acme.sh/acme.sh --issue --standalone -d SI.endpoint --server https://SI.ca/acme/acme/directory --ca-bundle $(step path)/certs/root_ca.crt
  fi
  sleep 7200
done

