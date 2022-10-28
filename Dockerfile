FROM golang:1.19-alpine3.16 as build

WORKDIR /app
RUN go mod init github.com/danvieira97/desafio-docker
COPY main.go ./


RUN go build -o /go-fullcycle

FROM alpine:latest

WORKDIR /

COPY --from=build /go-fullcycle /go-fullcycle

ENTRYPOINT ["/go-fullcycle"]
           