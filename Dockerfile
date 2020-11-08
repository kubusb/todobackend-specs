FROM ubuntu:trusty
MAINTAINER Jakub Porebski <jakub.porebski@gmail.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to PL
RUN sed -i "s/http:\/\/archive./http:\/\/pl.archive./g" /etc/apt/sources.list

# Install node.js
RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

# Install appllication dependencies
RUN npm install -g mocha@2.3.4 && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]
