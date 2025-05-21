#!/bin/bash

if [[ "$TINYVPN_MODE" == "server" ]]; then
    MODE_FLAG="-s"
    ADDR_FLAG="-l"
    ADDR_VALUE="$TINYVPN_ADDR"
elif [[ "$TINYVPN_MODE" == "client" ]]; then
    MODE_FLAG="-c"
    ADDR_FLAG="-r"
    ADDR_VALUE="$TINYVPN_ADDR"
else
    echo "Invalid TINYVPN_MODE: $TINYVPN_MODE"
    exit 1
fi

exec /usr/local/bin/tinyvpn \
    $MODE_FLAG \
    $ADDR_FLAG "$ADDR_VALUE" \
    --sub-net "$TINYVPN_SUBNET" \
    --tun-dev "$TINYVPN_TUN_DEV" \
    --sock-buf 10240 \
    --decode-buf 10240 \
    --fec "$TINYVPN_FEC" \
    --timeout "$TINYVPN_TIMEOUT"
