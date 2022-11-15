FROM golang:1.19 AS builder

WORKDIR /app

COPY .git .git
COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN go build -buildvcs -o /push-to-registry-pr

## Deploy
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=builder /push-to-registry-pr /push-to-registry-pr

EXPOSE 8081

USER nonroot:nonroot

ENTRYPOINT ["/push-to-registry-pr"]
