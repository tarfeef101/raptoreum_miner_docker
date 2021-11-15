FROM debian:11-slim
RUN apt update && \
    apt install -y libcurl4
COPY . /opt
WORKDIR /opt
CMD ./cpuminer.sh