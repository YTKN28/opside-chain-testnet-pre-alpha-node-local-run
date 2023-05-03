#!/usr/bin/env bash
work_dir=$(cd `dirname $0`; pwd)
cd $work_dir
source ./values.env
if [ ! -d "./data/" ];then
  echo -e "init node$node_index data \n";
  ./geth --datadir ./data init ./config/genesis.json
fi
nohup ./geth \
--config ./config/config.toml  \
--ipcpath ~/geth.ipc \
--authrpc.addr=127.0.0.1 \
--authrpc.vhosts="*" \
--authrpc.jwtsecret=./config/jwtsecret \
--authrpc.port=8551 \
--verbosity 3 2>> ./logs/geth.log &
