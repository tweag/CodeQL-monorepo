#!/bin/bash
set -x

TARGET_DIR="$1"

cd ./$TARGET_DIR
go get golang-x-net-sample
go build ./...
