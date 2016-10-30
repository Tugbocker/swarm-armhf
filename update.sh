#!/bin/bash

VERSION=1.2.5
git clone -b ${VERSION} https://github.com/docker/swarm.git swarm${VERSION}


mkdir gopath
export GOPATH=`pwd`/gopath
export GOARCH="arm"
export GOARM="7"
export CGO_ENABLED=0 

pushd swarm${VERSION}
go get github.com/docker/docker/pkg/discovery/file
go get github.com/docker/docker/pkg/discovery/kv
go get github.com/docker/docker/pkg/discovery/nodes
go get github.com/docker/swarm/cli
go get github.com/docker/swarm/discovery/token
go build -a -installsuffix cgo
cp swarm${VERSION} ../context/swarm
popd
