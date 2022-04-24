FROM golang:1.14-alpine as builder
LABEL maintainer="Julio Cesar <julio@blackdevs.com.br>"

WORKDIR /go/src/app

COPY go.mod go.sum ./
RUN go mod download
COPY application.go ./

RUN GOOS=linux GOARCH=amd64 GO111MODULE=on CGO_ENABLED=0 go build -o /go/src/app/main .

FROM gcr.io/distroless/static:nonroot

WORKDIR /
COPY --from=builder /go/src/app/main .
USER nonroot:nonroot

ARG MESSAGE
ENV MESSAGE=${MESSAGE:-"Hello World"}

EXPOSE 5000

ENTRYPOINT [ "/main" ]
