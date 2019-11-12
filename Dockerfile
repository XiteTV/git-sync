FROM golang:alpine

ENV version 3.1.2

ADD https://github.com/kubernetes/git-sync/archive/v$version.tar.gz .

RUN tar -xvf v$version.tar.gz &&\
    apk --update add git coreutils

WORKDIR git-sync-$version/cmd/git-sync

RUN GOOS=linux go build -tags prod -ldflags='-w -s ' -o /usr/local/bin/git-sync

COPY entrypoint.sh /usr/local/bin/


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
