BIN = wechat-work-message-push-go
IMAGE = wechat-work-message-push:latest

build:
	CGO_ENABLED=0 go build --ldflags "-s -w" -o $(BIN) .

clean:
	-rm -f $(BIN)

image:
	sudo buildah bud --format docker -t $(IMAGE) .
	sudo buildah login --authfile /etc/containers/auth.json docker.io
	sudo buildah push --authfile /etc/containers/auth.json $(IMAGE) docker://docker.io/80x86/$(IMAGE)


