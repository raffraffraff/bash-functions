FROM alpine:latest

RUN apk add -U bash curl jq ca-certificates gawk sed coreutils
ADD bashlib /etc/

ENTRYPOINT ["/bin/bash"]
