TAG = rvannauker/yarn
VERSION = 0.24.6
FILE_NAME = "yarn.dockerfile"
COMMAND = "--help"
DEBUG_COMMAND = "/bin/sh"
MICROBADGE_HOOK_URL = https://hooks.microbadger.com/images/rvannauker/yarn/tqK5SyLeRWqVU_P2s98QagWuOGg=

.PHONY: default build build_latest push run debug microbadge_hook release

default: build

build:
	/usr/bin/docker build \
	       --no-cache=true \
	       --build-arg=BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg=VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg=VERSION="$(VERSION)" \
	       --force-rm=true \
	       --tag="$(TAG):$(VERSION)" \
	       --file="$(FILE_NAME)" \
	       $$PWD

build_latest:
	/usr/bin/docker build \
	       --no-cache=true \
	       --build-arg=BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg=VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg=VERSION="latest" \
	       --force-rm=true \
	       --tag="$(TAG):latest" \
	       --file="$(FILE_NAME)" \
	       $$PWD

push:
	docker push $(TAG)

run:
	@docker run \
	       --rm=true \
	       --interactive=true \
           --name "yarn" \
           "$(TAG):$(VERSION)" \
           $(COMMAND)

debug:
	docker run \
	       --rm=true \
	       --interactive=true \
	       --entrypoint=$(DEBUG_COMMAND) \
	       "$(TAG):$(VERSION)"

microbadge_hook:
	curl -X POST $(MICROBADGE_HOOK_URL)

release: build build_latest push microbadge_hook