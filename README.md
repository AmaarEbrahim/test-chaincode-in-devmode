# Overview
The goal of this project was to run chaincode in dev mode using Hyperledger Fabric and Docker.
Hyperledger Fabric has a tutorial on this subject, and I tried to loosely follow it to work with Docker containers: https://hyperledger-fabric.readthedocs.io/en/latest/peer-chaincode-devmode.html#start-the-chaincode

Among other things, the guide covered (1) the environment variables that needed to be set prior to raising an organization, and (2) the flags to set to activate DevMode in the peer.

Unfortunately, DevMode requires disabling TLS, but it appears that TLS is necessary to host organizations in different containers, according to this error that I get when I disable TLS:
```bash
orderer.example.com     | 2023-07-21 03:55:37.694 UTC 0007 PANI [orderer.common.server] reuseListener -> TLS is required for running ordering nodes of cluster type.
orderer.example.com     | panic: TLS is required for running ordering nodes of cluster type.
orderer.example.com     | 
orderer.example.com     | goroutine 1 [running]:
orderer.example.com     | go.uber.org/zap/zapcore.(*CheckedEntry).Write(0xc000022000, {0x0, 0x0, 0x0})
orderer.example.com     |       /vendor/go.uber.org/zap/zapcore/entry.go:232 +0x44c
orderer.example.com     | go.uber.org/zap.(*SugaredLogger).log(0xc000123278, 0x4, {0x10d2dd7?, 0xc000344de8?}, {0x0?, 0xf49040?, 0xc000299770?}, {0x0, 0x0, 0x0})
orderer.example.com     |       /vendor/go.uber.org/zap/sugar.go:227 +0xee
orderer.example.com     | go.uber.org/zap.(*SugaredLogger).Panicf(...)
orderer.example.com     |       /vendor/go.uber.org/zap/sugar.go:159
orderer.example.com     | github.com/hyperledger/fabric/common/flogging.(*FabricLogger).Panicf(...)
orderer.example.com     |       /common/flogging/zap.go:74
orderer.example.com     | github.com/hyperledger/fabric/orderer/common/server.reuseListener(0xc0003a7400)
orderer.example.com     |       /orderer/common/server/main.go:385 +0x13f
orderer.example.com     | github.com/hyperledger/fabric/orderer/common/server.initializeClusterClientConfig(0xc0003a7400)
orderer.example.com     |       /orderer/common/server/main.go:544 +0xf2
orderer.example.com     | github.com/hyperledger/fabric/orderer/common/server.Main()
orderer.example.com     |       /orderer/common/server/main.go:180 +0xc45
orderer.example.com     | main.main()
orderer.example.com     |       /cmd/orderer/main.go:15 +0x17
orderer.example.com     | 
``` 

Maybe it is possible to work around the TLS issue and use Docker containers for organizations, but I suspect that it would be tricky to do. It seems like DevMode setup would be easiest when all organizations are configured to run in the same environment. 
