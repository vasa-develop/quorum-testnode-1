#!/bin/bash
set -u
set -e

for i in {1..3}
do
    DDIR="qdata/c$i"
    mkdir -p $DDIR
    mkdir -p qdata/logs
    cp "keys/tm$i.pub" "$DDIR/tm.pub"
    cp "keys/tm$i.key" "$DDIR/tm.key"
    rm -f "$DDIR/tm.ipc"
    CMD="constellation-node --url=https://18.188.219.84:900$i/ --port=900$i --workdir=$DDIR --socket=tm.ipc --publickeys=tm.pub --privatekeys=tm.key --othernodes=https://18.188.219.84:9001/"
    echo "$CMD >> qdata/logs/constellation$i.log 2>&1 &"
    $CMD >> "qdata/logs/constellation$i.log" 2>&1 &
done

DOWN=true
while $DOWN; do
    sleep 0.1
    DOWN=false
    for i in {1..3}
    do
	if [ ! -S "qdata/c$i/tm.ipc" ]; then
            DOWN=true
	fi
    done
done
