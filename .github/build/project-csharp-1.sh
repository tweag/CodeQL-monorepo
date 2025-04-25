#!/bin/bash
set -x

TARGET_DIR="$1"

cd ./$TARGET_DIR
dotnet restore
dotnet build --configuration Release
