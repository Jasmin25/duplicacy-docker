FROM alpine:latest

ARG DUPLICACY_VERSION
ENV DUPLICACY_VERSION=${DUPLICACY_VERSION}

# Install curl
RUN apk add --no-cache curl

# Download Duplicacy CLI matching the version arg
RUN curl -L -o /usr/local/bin/duplicacy \
    https://github.com/gilbertchen/duplicacy/releases/download/v${DUPLICACY_VERSION}/duplicacy_linux_x64_${DUPLICACY_VERSION} \
    && chmod +x /usr/local/bin/duplicacy

WORKDIR /data

ENTRYPOINT ["duplicacy"]
