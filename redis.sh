#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

echo -e "${BL}Info:${NC} Running Redis with version: ${GR}$INPUT_VERSION${NC}"
docker run \
  -d \
  --platform linux/amd64 \
  --network=bridge \
  --name redis \
  -e ALLOW_EMPTY_PASSWORD=yes \
  -d bitnami/redis:"$INPUT_VERSION"

containerIp=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' redis)

echo -e "${BL}Info:${NC} Wait for Redis to be up and receiving requests..."
docker exec redis bash -c "for i in seq 1 10; do redis-cli ping && s=0 && break || s=$? && sleep 5; done; (exit $s)"
REDIS_LIVENESS_EXIT_CODE=$?

if [ "$REDIS_LIVENESS_EXIT_CODE" != "0" ]; then
  echo "::error::Redis liveness failed with exit code: $REDIS_LIVENESS_EXIT_CODE"
  exit $REDIS_LIVENESS_EXIT_CODE
fi

echo -e "${BL}Info:${NC} Set Redis container ip to: $containerIp"
echo "container-ip=$containerIp" >> "$GITHUB_OUTPUT"
