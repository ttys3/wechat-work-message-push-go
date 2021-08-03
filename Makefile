BIN = wechat-work-message-push-go

build:
	CGO_ENABLED=0 go build --ldflags "-s -w" -o $(BIN) .

clean:
	-rm -f $(BIN)
