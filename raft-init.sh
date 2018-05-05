#!/bin/bash
set -u
set -e

//creating the permissioned-nodes.json
echo '[
  "enode://ac6b1096ca56b9f6d004b779ae3728bf83f8e22453404cc3cef16a3d9b96608bc67c4b30db88e0a5a6c6390213f7acbe1153ff6d23ce57380104288ae19373ef@$1:21000?discport=0&raftport=50401",
  "enode://3d9ca5956b38557aba991e31cf510d4df641dce9cc26bfeb7de082f0c07abb6ede3a58410c8f249dabeecee4ad3979929ac4c7c496ad20b8cfdd061b7401b4f5@$2:21003?discport=0&raftport=50404"
]' > permissioned-nodes.json

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Configuring node 1 (permissioned)"
mkdir -p qdata/dd1/{keystore,geth}
cp permissioned-nodes.json qdata/dd1/static-nodes.json
cp permissioned-nodes.json qdata/dd1/
cp keys/key1 qdata/dd1/keystore
cp raft/nodekey1 qdata/dd1/geth/nodekey
geth --datadir qdata/dd1 init genesis.json

