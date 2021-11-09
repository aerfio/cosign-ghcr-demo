FROM golang:1.17-alpine as builder

WORKDIR /workspace

COPY go.mod .
COPY main.go .

RUN go build -o app .

FROM gcr.io/distroless/static:nonroot
WORKDIR /
COPY --from=builder /workspace/app .

ENTRYPOINT ["/app"]
