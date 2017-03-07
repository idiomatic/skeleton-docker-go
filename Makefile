APP=skeleton-docker-go
PORT=8338

all: build run

$(APP):
	docker run --rm -v "$$PWD":/go/src/$@ -w /go/src/$@ golang:latest go build -v -o $@

build: $(APP)
	docker build -t $(APP) .

run: build
	docker run --rm --name $(APP) --publish=$(PORT):80 $(APP)

test:
	docker run --rm -v "$$PWD":/go/src/$(APP) -w /go/src/$(APP) golang:latest go test

shell:
	docker run -ti --rm $(APP) sh

clean:
	-rm $(APP)
	-docker kill $(APP)
	-docker rmi $(APP)
