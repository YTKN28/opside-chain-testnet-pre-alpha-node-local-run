#!/usr/bin/env bash
work_dir=$(cd `dirname $0`; pwd)
cd $work_dir
source ./values.env
nohup ./beacon-chain \
--accept-terms-of-use \
--verbosity=debug \
--datadir=./data \
--bootstrap-node=enr:-MK4QGMTVzq_LYXsdog9v7hcODkppm1-HpKWSZRtxlqjZGgefHjPozJ-UnDVNA0o9uSlbCpnmRQDvPTzlGenjqrdpoKGAYe3x_w0h2F0dG5ldHOIAAAAAAAAAACEZXRoMpB9v7DEQAAAQP__________gmlkgnY0gmlwhCzLOhmJc2VjcDI1NmsxoQKVs9oJPD98lxdXMJD7GznNTBrUNAnWnSeN7nEayjFTtIhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A \
--bootstrap-node=enr:-MK4QCvI4SKDTGHKEXOSUird8zdIbVVheE8ZNMNMd4WT_FmPchCU7VOxgEOSd9dLZKbkyzClFU_iJOHgJ_PpGmN78C-GAYe3x_xRh2F0dG5ldHOIAAAAAAAAAACEZXRoMpB9v7DEQAAAQP__________gmlkgnY0gmlwhBLQmTiJc2VjcDI1NmsxoQJ6E6-Puqc_vBSsUEmRHLQDQgy-SyNBPmmZCD394TL7EohzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A \
--bootstrap-node=enr:-MK4QP1Ao8u4ynuNaXPmSsXDFDmVhLRCQHarOIJbwNaxSUwNWOxny8OMs22_dSciaEhMlHtoSA-RU5p3ncIkIwpb2ASGAYe3x_wuh2F0dG5ldHOIAAAAAAAAAACEZXRoMpB9v7DEQAAAQP__________gmlkgnY0gmlwhCzJsnuJc2VjcDI1NmsxoQN30gAxeIDulOctpAPm_hfDWbgaOmApVWesaIvHCWIF1ohzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A \
--genesis-state=./config/genesis.ssz \
--execution-endpoint=http://127.0.0.1:8551 \
--jwt-secret=./config/jwtsecret \
--chain-config-file=./config/config.yaml \
--contract-deployment-block 0 \
--deposit-contract=0x4242424242424242424242424242424242424242 \
--p2p-local-ip=0.0.0.0 \
--p2p-max-peers=100 \
--p2p-tcp-port=13000 \
--p2p-udp-port=12000 \
--rpc-host=127.0.0.1 \
--rpc-port=4000 \
--grpc-gateway-host=127.0.0.1 \
--grpc-gateway-port=3500 \
--enable-debug-rpc-endpoints \
--min-sync-peers=1 \
--suggested-fee-recipient=$WITHDRAWAL 2>> ./logs/beacon-chain.log &
