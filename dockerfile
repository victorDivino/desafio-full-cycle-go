FROM golang:latest AS builder

WORKDIR /app

COPY hello.go .
RUN go mod init hello && \
    go build -v -o app

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

CMD ["./app"]