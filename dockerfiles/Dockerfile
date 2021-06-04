FROM ubuntu:20.04
WORKDIR /work
RUN apt-get update && apt-get update && apt-get -y install --no-install-recommends \
        curl git python build-essential lsb-release ca-certificates gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN export STORJ_NETWORK=STORX && \
    git clone https://github.com/StorXNetwork/core-daemon  && \
    cd core-daemon && \
    npm i && npm link

EXPOSE 50505 50506 50508 50509
ENTRYPOINT ["bash", "/work/start-node.sh"]
