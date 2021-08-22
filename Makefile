VERSION ?=v0.0.8

build:
	GOOS=linux GOARCH=amd64 go build -o bin/test-demo main.go

docker-build: build
	docker build -t docker.shijunlee.local/library/gateway-test-demo:${VERSION} .

docker-push:
	docker push docker.shijunlee.local/library/gateway-test-demo:${VERSION}
