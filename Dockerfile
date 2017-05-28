#
# An Alpine Linux container with helper scripts for installing packages
#
#
# An Alpine Linux container with helper scripts for installing packages
#
FROM alpine:3.5

# linuxserver.io's images default to having abc user with gid/uid 911
RUN addgroup -g 911 app \
 && adduser -G app -D -u 911 app

# helper to install things and cleanup to keep image sizes down
ADD docker-apk-install.sh /usr/local/sbin/docker-apk-install

RUN docker-apk-install su-exec

ARG BUILD_DATE
ARG CI_BUILD_URL
ARG VCS_REF
ARG VERSION

LABEL \
    io.github.cryptoplay.build-date=$BUILD_DATE \
    io.github.cryptoplay.ci-build-url=$CI_BUILD_URL \
    io.github.cryptoplay.name="Alpine" \
    io.github.cryptoplay.description="Our CryptoPlay Alpine Base Image for Running in Docker Container" \
    io.github.cryptoplay.url="https://cryptoplay.github.io/" \
    io.github.cryptoplay.docker.dockerfile="/Dockerfile" \
    io.github.cryptoplay.license="Apache License 2.0" \
    io.github.cryptoplay.vcs-ref=$VCS_REF \
    io.github.cryptoplay.vcs-type="Git" \
    io.github.cryptoplay.vcs-url="https://github.com/cryptoplay/docker-alpine.git" \
    io.github.cryptoplay.vendor="CryptoPlay" \
    io.github.cryptoplay.version=$VERSION
