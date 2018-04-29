TAG = python-clojure:latest

.PHONY: all
all: build

# LOCAL #######################################################################

.PHONY: doctor
doctor:
	pip install --user verchew && python -m verchew --exit-code

# DOCKER ######################################################################

.PHONY: build
build:
	docker build . --pull --tag=$(TAG)

.PHONY: test
test:
	docker run -v $(PWD):/host -i $(TAG) bash -c "cp -a /host/. . && make doctor"
