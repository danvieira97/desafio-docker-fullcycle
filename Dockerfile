FROM golang:1.8.4-alpine3.6 as builder

COPY . .
RUN go build -o /go-fullcycle

FROM scratch

COPY --from=builder /go-fullcycle /go-fullcycle

CMD ["/go-fullcycle"]
           