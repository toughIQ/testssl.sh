FROM debian:stretch-slim
LABEL maintainer="toughIQ <toughiq@gmail.com>"

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssl host procps bsdmainutils \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /testssl
WORKDIR /testssl
ADD testssl.sh .
ADD etc /testssl/etc
ENTRYPOINT ["/testssl/testssl.sh"]
