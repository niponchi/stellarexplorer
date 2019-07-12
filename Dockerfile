FROM node:10.16.0-alpine

RUN mkdir test && \
    cd test

ADD . /app

WORKDIR /app

RUN apk add --no-cache --virtual .gyp \
    autoconf \
    automake \
    g++ \
    libtool \
    python \
    make \
    g++ \
    && npm install \
    && apk del .gyp

EXPOSE 3000

ENTRYPOINT ["npm", "start"]
STOPSIGNAL SIGTERM