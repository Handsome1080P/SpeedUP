# SpeedUP
UDP2RAW TinyFECVPN Docker Combo.

## Original
```
https://github.com/wangyu-/udp2raw
https://github.com/wangyu-/tinyfecVPN
https://github.com/MikeWang000000/udp2raw
```

## Build
> 1. git clone to local.
> 2. docker build . -t SpeedUP

## How to run

```
docker run -d --name myvpn \
  -e UDP2RAW_MODE=server \
  -e UDP2RAW_LOCAL_ADDR=0.0.0.0:50000 \
  -e UDP2RAW_REMOTE_ADDR=127.0.0.1:100 \
  -e UDP2RAW_DEV=ens192 \
  -e UDP2RAW_RAW_MODE=faketcp \
  -e UDP2RAW_SEQ_MODE=3 \
  -e UDP2RAW_LOG_LEVEL=4 \
  -e UDP2RAW_CIPHER_MODE=aes128cbc \
  -e UDP2RAW_AUTH_MODE=md5 \
  -e UDP2RAW_KEY="D3xe3mSH9U" \
  -e TINYVPN_MODE=server \
  -e TINYVPN_ADDR=127.0.0.1:100 \
  -e TINYVPN_SUBNET=10.44.0.0 \
  -e TINYVPN_TUN_DEV=tun0 \
  -e TINYVPN_FEC=20:10 \
  -e TINYVPN_TIMEOUT=8 \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  --network host \
  speeder

docker run -d --name myvpn \
  -e UDP2RAW_MODE=client \
  -e UDP2RAW_LOCAL_ADDR=127.0.0.1:100 \
  -e UDP2RAW_REMOTE_ADDR=192.168.30.102:50000 \
  -e UDP2RAW_DEV=ens192 \
  -e UDP2RAW_RAW_MODE=faketcp \
  -e UDP2RAW_SEQ_MODE=3 \
  -e UDP2RAW_LOG_LEVEL=4 \
  -e UDP2RAW_CIPHER_MODE=aes128cbc \
  -e UDP2RAW_AUTH_MODE=md5 \
  -e UDP2RAW_KEY="D3xe3mSH9U" \
  -e TINYVPN_MODE=client \
  -e TINYVPN_ADDR=127.0.0.1:100 \
  -e TINYVPN_SUBNET=10.44.0.0 \
  -e TINYVPN_TUN_DEV=tun99 \
  -e TINYVPN_FEC=20:10 \
  -e TINYVPN_TIMEOUT=8 \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  --network host \
  speeder
```