ARG PLATFORM
FROM --platform=$PLATFORM golang:1.17

WORKDIR /lmstfy

ARG TARGET_OS TARGET_ARCH

ADD ./ /lmstfy
RUN apt update -y && apt install -y netcat
RUN cd /lmstfy && make TARGET_OS=$TARGET_OS TARGET_ARCH=$TARGET_ARCH
EXPOSE 7777:7777
ENTRYPOINT ["/lmstfy/_build/lmstfy-server", "-c", "/lmstfy/config/docker-image-conf.toml"]

