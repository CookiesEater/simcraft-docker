FROM ubuntu:latest

MAINTAINER Alexey Shishkov <cookies.eater.03@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    gcc \
    build-essential \
    g++ \
    git \
    cpp \
    libssl-dev

RUN env GIT_SSL_NO_VERIFY=true git clone --depth 1 https://github.com/simulationcraft/simc.git
WORKDIR simc/engine
RUN make OPENSSL=1 optimized

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]