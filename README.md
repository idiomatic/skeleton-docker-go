# About

[skeleton-docker-go] is a baseline [Go](https://golang.org) project that:

1. compiles a trivial webserver in a "throw-away" Docker build container
2. builds a Docker image with that webserver

This strategy omits the source from the runtime image.

# Usage

## containerized app build

Optional.  May build a binary with dynamic library dependencies.

    make skeleton-docker-go

## image build

Build a Docker image.

    make build

## test

Build and run tests in a disposable container.

    make test

## run

Launch the container.

    make run

Exit with Ctrl-C (or similar).

## clean

Remove all byproducts.

    make clean
