.PHONY: all
all: build

.PHONY: build
build:
	docker build .
