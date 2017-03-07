APP    = skeleton-docker-go
PORT   = 8338
DOCKER = /usr/local/bin/docker

all: test build run

$(APP): $(DOCKER)
	$(DOCKER) run --rm -v "$$PWD":/go/src/$@ -w /go/src/$@ golang:latest go build -v -o $@

build: $(DOCKER) $(APP)
	$(DOCKER) build -t $(APP) .

run: build $(DOCKER)
	$(DOCKER) run --rm --name $(APP) --publish=$(PORT):80 $(APP)

test: $(DOCKER)
	$(DOCKER) run --rm -v "$$PWD":/go/src/$(APP) -w /go/src/$(APP) golang:latest go test

shell: $(DOCKER)
	$(DOCKER) run -ti --rm $(APP) sh

clean: $(DOCKER)
	-rm $(APP)
	-$(DOCKER) kill $(APP)
	-$(DOCKER) rmi $(APP)

$(DOCKER):
	[ `uname -s` = Darwin ] && brew install docker

.PHONY: all build run test shell clean
