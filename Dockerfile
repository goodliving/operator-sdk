FROM golang
RUN git config --global user.email "panzhengming91@163.com"
RUN git config --global user.name "panzhengming"
RUN go get -u github.com/golang/dep/cmd/dep && mkdir /go/src/github.com/operator-framework/operator-sdk -p
WORKDIR /go/src/github.com/operator-framework/operator-sdk
ADD . /go/src/github.com/operator-framework/operator-sdk
RUN make dep && make install
RUN mkdir $GOPATH/src/github.com/example-inc/ -p && cd $GOPATH/src/github.com/example-inc/
RUN operator-sdk new app-operator --api-version=app.example.com/v1alpha1 --kind=App
