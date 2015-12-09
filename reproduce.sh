#!/bin/sh

REPEATS=100

uname -a;

echo "Running $REPEATS compose up clean cycles"

for i in $(seq 1 $REPEATS); do
    echo $i;
    docker-compose up -d
    sleep 20;
    ps aux | grep 'Z' | grep -v COMMAND | grep -v grep
    docker-container-clean > /dev/null
done
