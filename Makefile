BIN = wechat-work-message-push-go
IMAGE = wechat-work-message-push:latest

build:
	CGO_ENABLED=0 go build --ldflags "-s -w" -o $(BIN) .

clean:
	-rm -f $(BIN)

image: export BUILDAH_FORMAT=docker
image: export REGISTRY_AUTH_FILE=/etc/containers/auth.json
image:
	sudo podman build -t $(IMAGE) .
	sudo podman login docker.io
	sudo podman push $(IMAGE) docker://docker.io/80x86/$(IMAGE)


