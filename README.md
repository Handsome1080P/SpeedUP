# SpeedUP
UDP2RAW+TinyFECVPN Docker Combo With HTTP Header Spoof.
> You can git clone this repo to local then replace the binary files as you want.

## Original
```
https://github.com/wangyu-/udp2raw
https://github.com/wangyu-/tinyfecVPN
https://github.com/MikeWang000000/udp2raw
```

## Build
```
1. git clone to local.
2. docker build . -t speeder
```

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

## ENV Settings
```
UDP2RAW_MODE #server or client.
UDP2RAW_LOCAL_ADDR #local listen addr,ipv6 must with [].
UDP2RAW_REMOTE_ADDR #remote addr,ipv6 must with [].
UDP2RAW_DEV #listen or outgoing nic.
UDP2RAW_RAW_MODE #spoof mode.
UDP2RAW_SEQ_MODE #seq mode.
UDP2RAW_LOG_LEVEL #log level.
UDP2RAW_CIPHER_MODE #cipher mode.
UDP2RAW_AUTH_MODE #auth mode.
UDP2RAW_KEY #keypass
TINYVPN_MODE #server or client.
TINYVPN_ADDR #listen addr.
TINYVPN_SUBNET #vpn subnet.like 10.0.0.0/24.
TINYVPN_TUN_DEV #vpn nic name,like tun0.
TINYVPN_FEC #fec option.like 20:10.
TINYVPN_TIMEOUT #fec timeout.
```

## ENV Optional

```
UDP2RAW_HTTP=true #enable HTTP header spoof.
UDP2RAW_DOMAIN=baidu.com #set up spoof domain.
```