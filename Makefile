account = vungle
project = docker-base

all: build test push deploy

build:
	@echo "Building..."
	@docker build . | tail -n 1 | awk '{print $$3}' | xargs echo -n > .last_build
	@echo "Build ID: $$(cat .last_build)"

test:
	@docker run -ti --rm $$(cat .last_build) /bin/bash -c 'curl -s -o /dev/null -w "%{http_code}" http://www.example.org/'

tag:
	@docker tag $$(cat .last_build) $(account)/$(project):$$(cat .last_build) 

push: tag
	@docker push $(account)/$(project):$$(cat .last_build)

push_latest:
	@docker tag $$(cat .last_build) $(account)/$(project)
	@docker push $(account)/$(project)
