#!/usr/bin/env bash
work_dir=$(cd `dirname $0`; pwd)
cd $work_dir
cp ./config/values.env ./geth/
bash ./geth/run.sh