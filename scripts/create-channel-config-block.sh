source shared.sh

configtxgen -profile TwoOrgsApplicationGenesis -channelID syschannel -configPath $FABRIC_CFG_PATH -outputBlock "${PWD}/../channel-artifacts/genesisblock"
