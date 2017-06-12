default: build

build:
	go build -a -tags netgo -ldflags '-s -w' -o $$(pwd)/docker-http-server

clean:
	rm -rf $$(pwd)/docker-http-server

docker:
	docker build --pull=true --rm=true -t patrickdappollonio/docker-http-server .

ci:
	$(MAKE) build
	$(MAKE) docker
	$(MAKE) clean

.PHONY: build clean docker ci

.NOTPARALLEL: