#!/bin/bash

docker rm windward
docker run -it -p 6012:6012/udp -p 6012:6012/tcp -v /app/docker/temp-vol:/app \
	-e WINDWARD_SERVER_NAME="T3stN3t Sail HO! - Discord" \
	-e WINDWARD_SERVER_WORLD="T3stN3t" \
	-e WINDWARD_SERVER_PORT="6012" \
	--name windward antimodes201/windward-server:build
