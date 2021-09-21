#!/bin/sh
set -e

gaiad version
#init with moniker
gaiad init "test"
sed -i 's/^chain-id.*/chain-id = "cosmoshub-testnet"/' /root/.gaia/config/client.toml
sed -i 's/^node.*/node = "https:\/\/rpc.testnet.cosmos.network:443"/' /root/.gaia/config/client.toml
sleep infinity
