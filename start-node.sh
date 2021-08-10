#!/bin/bash
echo "A StorX Nodes ..."

INSTANCE_IP=$(curl https://checkip.amazonaws.com)
STORXDATA="$PWD"/work/storxdata
CONFIGPATH="$STORXDATA"/config/storx_"$INSTANCE_IP".json
xcore daemon 


if [ ! -e "$CONFIGPATH" ]	
then
  echo "Creating StorX Nodes ..."
  mkdir "$STORXDATA"/config
  mkdir "$STORXDATA"/logs
  mkdir "$STORXDATA"/data
  xcore create --storx "$WALLETADD" --storage "$STORXDATA"/data --size 1TB --rpcport "$STORXPORT" --rpcaddress "$INSTANCE_IP" --noedit --outfile "$CONFIGPATH" --logdir "$STORXDATA"/logs
fi


export STORJ_NETWORK=STORX
xcore daemon --status
echo "Starting StorX Nodes ....."
xcore start --config "$CONFIGPATH" 
while true; do sleep 1000; done

