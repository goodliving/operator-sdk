FROM golang
RUN go get -u github.com/golang/dep/cmd/dep && mkdir /go/src/github.com/operator-framework/operator-sdk -p
WORKDIR /go/src/github.com/operator-framework/operator-sdk
ADD . /go/src/github.com/operator-framework/operator-sdk
RUN make dep && make install
