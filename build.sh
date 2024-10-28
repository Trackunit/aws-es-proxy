#!/usr/bin/env bash

set -euo pipefail

BUILD_TIME=$(date -u +"%Y-%m-%d-%H%M")

function dockerBuild {
  local image=$1
  echo "Building ${image}..."
  docker buildx build . --platform linux/amd64 --no-cache --pull -f Dockerfile -t "${image}"
  docker push "${image}"
  echo "Pushed ${image}..."
}

echo "Building aws-es-proxy..."
dockerBuild "trackunit/aws-es-proxy:1.5-${BUILD_TIME}"
