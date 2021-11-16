FROM alpine:latest AS builder
WORKDIR /opt
COPY build.sh /opt
RUN apk add curl jq && \
    /opt/build.sh

FROM debian:11-slim
RUN apt update && \
    apt install -y libcurl4
COPY --from=builder /opt /opt/
COPY healthcheck.sh entrypoint.sh /opt/
HEALTHCHECK CMD /opt/healthcheck.sh
WORKDIR /opt
CMD ./entrypoint.sh
