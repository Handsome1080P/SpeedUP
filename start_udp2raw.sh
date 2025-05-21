#!/bin/bash
if [[ "$UDP2RAW_MODE" == "client" ]]; then
    MODE_FLAG="-c"
elif [[ "$UDP2RAW_MODE" == "server" ]]; then
    MODE_FLAG="-s"
else
    exit 1
fi
LADDR="$UDP2RAW_LOCAL_ADDR"
RADDR="$UDP2RAW_REMOTE_ADDR"
CMD=(
    /usr/local/bin/udp2raw
    $MODE_FLAG
    -l "$LADDR"
    -r "$RADDR"
    --dev "$UDP2RAW_DEV"
    --raw-mode "$UDP2RAW_RAW_MODE"
    --seq-mode "$UDP2RAW_SEQ_MODE"
    --force-sock-buf
    --sock-buf 10240
    --log-level "${UDP2RAW_LOG_LEVEL:-4}"
    --cipher-mode "$UDP2RAW_CIPHER_MODE"
    --auth-mode "$UDP2RAW_AUTH_MODE"
    --fix-gro
    --key "$UDP2RAW_KEY"
    -a
)
if [[ "$UDP2RAW_HTTP" == "true" && -n "$UDP2RAW_DOMAIN" ]]; then
    CMD+=(--fake-http "$UDP2RAW_DOMAIN")
fi
exec "${CMD[@]}"
