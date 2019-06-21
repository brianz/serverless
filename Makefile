NAME = brianz/serverless
SERVERLESS_VERSION = 1.45.0
YARN_VERSION = 1.16.0

.PHONY:	all py3 shell


all : py3

py3 :
	docker build \
		-t $(NAME):$(SERVERLESS_VERSION) \
		-f Dockerfile \
		--build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
		--build-arg YARN_VERSION=$(YARN_VERSION) \
		.

py3-shell :
	docker run --rm -it $(NAME):$(SERVERLESS_VERSION) bash

push :
	docker push $(NAME):$(SERVERLESS_VERSION)

push-latest :
	docker push $(NAME):latest
