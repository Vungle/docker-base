all: build test push deploy

build:
	docker build . | tail -n 1 | awk '{print $$3}' | xargs echo -n > .last_build

test:
	docker run $$(cat .last_build) "bin/bash -c 'echo hello'"

push:
		docker tag $$(cat .last_build) vungle/kube-monitor:$$(cat .last_build) 
			docker push vungle/docker-base:$$(cat .last_build)
