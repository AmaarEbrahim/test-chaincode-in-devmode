#!/bin/bash

source shared.sh

cryptogen generate --config=../cryptogen-config/crypto-config-orderer.yaml --output="../organizations"
cryptogen generate --config=../cryptogen-config/crypto-config-org1.yaml --output="../organizations"
cryptogen generate --config=../cryptogen-config/crypto-config-org2.yaml --output="../organizations"
