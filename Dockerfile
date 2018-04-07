FROM ubuntu:latest

MAINTAINER Alexey Shishkov <cookies.eater.03@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    gcc \
    build-essential \
    g++ \
    git \
    libssl-dev \
    ca-certificates

RUN git clone --depth 1 https://github.com/simulationcraft/simc.git \
    && cd simc/engine \
    && make OPENSSL=1 optimized

WORKDIR /simc/engine
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
