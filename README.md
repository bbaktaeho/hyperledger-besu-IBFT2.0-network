# Test Env

### Prerequisites

- curl
- java 11
- besu
- docker, docker-compose

### Settings network (local)

Do not use Docker!

```bash
pwd

besu-private-net-ibft
```

Generate key-pair and genesis.json.

```bash
./generate.sh
```

Start the first node1 as the bootnode.

```bash
cd node1
besu --data-path=data --genesis-file=../genesis.json --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="\*" --rpc-http-cors-origins="all"
```

the default of p2p-port is 30303. <br><br>

Copy the enode URL and create a new terminal for each node.

```bash
cd node2
besu --data-path=data --genesis-file=../genesis.json --bootnodes=<enode URL> --p2p-port=30304 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8546
```

```bash
cd node3
besu --data-path=data --genesis-file=../genesis.json --bootnodes=<enode URL> --p2p-port=30305 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8547
```

```bash
cd node4
besu --data-path=data --genesis-file=../genesis.json --bootnodes=<enode URL> --p2p-port=30306 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8548
```

### Confirm the private network is working

```bash
curl -X POST --data '{"jsonrpc":"2.0","method":"ibft_getValidatorsByBlockNumber","params":["latest"], "id":1}' localhost:8545
```

Look at the logs to confirm
