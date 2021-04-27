#!/bin/bash
echo "A StorX Nodes ..."

INSTANCE_IP=$(curl https://checkip.amazonaws.com)
STORXDATA=/work/storxdata 
CONFIGPATH="$STORXDATA"/storx_"$INSTANCE_IP".json
xcore daemon 


if [ ! -e "$CONFIGPATH" ]	
then
  echo "Creating StorX Nodes ..."
  xcore create --storx "$WALLETADD" --storage "$STORXDATA" --size 1TB --rpcport 45678 --rpcaddress "$INSTANCE_IP" --noedit --outfile "$CONFIGPATH" --logdir "$STORXDATA"
fi


export STORJ_NETWORK=STORX
xcore daemon --status
echo "Starting StorX Nodes ..."
xcore start --config "$CONFIGPATH" 
while true; do sleep 1000; done

