#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

echo -e "${BL}Info:${NC} Running Redis with version: ${GR}$INPUT_VERSION${NC}"
docker run \
  --platform linux/amd64 \
  --network=bridge \
  --name redis \
  -e ALLOW_EMPTY_PASSWORD=yes \
  -d bitnami/redis:"$INPUT_VERSION"

containerIp=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mysql)

echo -e "${BL}Info:${NC} Wait for Redis to be up and receiving requests..."
docker run \
  --platform linux/amd64 \
  --network=bridge \
  appropriate/nc:latest \
  "sh" "-c" "for i in seq 1 10; do nc -w2 -v $containerIp 6379 && s=0 && break || s=$? && sleep 5; done; (exit $s)"

echo -e "${BL}Info:${NC} Set Redis container ip to: $containerIp"
echo "::set-output name=container-ip::$containerIp"
