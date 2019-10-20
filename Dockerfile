FROM golang:alpine

EXPOSE 8000/tcp

ENTRYPOINT ["todo"]

RUN \
    apk add --update git && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /go/src/todo
WORKDIR /go/src/todo

COPY . /go/src/todo

RUN go get github.com/GeertJohan/go.rice/rice
RUN go install -v
