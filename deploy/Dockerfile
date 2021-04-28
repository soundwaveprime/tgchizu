FROM reaitten/tgchizu:main-latest
WORKDIR /usr/src/app
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
COPY . .
