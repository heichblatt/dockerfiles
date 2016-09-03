TAG ?= $(USER)/gollum
REPODIR ?= $(HOME)/src/gollum

build:
	docker build -t $(TAG) .

rebuild: build

build-nocache:
	docker build --no-cache -t $(TAG) .

update: build-nocache

run:
	docker run -d -p 4567:4567 -v $(REPODIR):/repo $(TAG):latest
