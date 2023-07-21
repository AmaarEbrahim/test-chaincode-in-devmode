#!/bin/bash

source shared.sh

docker-compose -f ../compose/compose-test-net.yaml -f ../compose/docker/docker-compose-test-net.yaml down
docker-compose -f ../compose/compose-test-net.yaml -f ../compose/docker/docker-compose-test-net.yaml up 