#!/usr/bin/env bash
work_dir=$(cd `dirname $0`; pwd)
cd $work_dir
source ./values.env
echo $PASSWORD > ./config/wallet/wallet_pass.txt
./validator accounts import --wallet-dir $work_dir/config/wallet --keys-dir $work_dir/config/wallet --wallet-password-file $work_dir/config/wallet/wallet_pass.txt --account-password-file $work_dir/config/wallet/wallet_pass.txt --accept-terms-of-use
nohup ./validator \
--accept-terms-of-use \
--beacon-rpc-provider 127.0.0.1:4000 \
--rpc \
--grpc-gateway-host 127.0.0.1 \
--grpc-gateway-port 7500 \
--force-clear-db \
--chain-config-file=./config/config.yaml \
--suggested-fee-recipient=$WITHDRAWAL \
--wallet-password-file=./config/wallet/wallet_pass.txt \
--wallet-dir=./config/wallet/ 2>> ./logs/validator.log &
