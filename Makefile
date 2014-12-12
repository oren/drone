pwd := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

docker:
	docker build -t web_server .
	docker run --rm -ti -p 3000:3000 -v $(pwd):/go/src/app --name web_server web_server /bin/bash

rm:
	# stop and rm all containers
	-docker stop $(shell docker ps -q)
	docker rm $(shell docker ps -aq)

rmi:
	# delete images that are not used by any tagged image
	-docker rmi $(shell docker images | grep "<none>" | awk '{print $3}')
