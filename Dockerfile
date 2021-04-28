FROM ubuntu:latest
ENV DEBIAN_FRONTEND='noninteractive'
RUN apt-get -qq update && apt-get -qq install -y tzdata curl aria2 python3 python3-pip \
    locales python3-lxml pv jq nano ffmpeg p7zip-full p7zip-rar libcrypto++-dev libssl-dev \
    libc-ares-dev libcurl4-openssl-dev libsqlite3-dev libsodium-dev && rm -rf /var/lib/apt/lists/* && \
    curl -L https://github.com/jaskaranSM/megasdkrest/releases/download/v0.1/megasdkrest -o /usr/local/bin/megasdkrest && \
    chmod +x /usr/local/bin/megasdkrest
RUN pip3 install --no-cache-dir tgchizu
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod u+x /usr/local/bin/extract && chmod u+x /usr/local/bin/pextract
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8' TZ='America/Toronto'
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
CMD ["python3", "-m", "tgchizu"]