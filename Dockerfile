FROM node:16-alpine AS builder

RUN apk add --no-cache \
        python3 \
        eudev-dev \
        linux-headers \
        build-base \
        git

WORKDIR /makecode

RUN git clone --depth=1 https://github.com/microsoft/pxt-microbit.git \
    && cd pxt-microbit \
    && npm install -g pxt \
    && npm install \
    && npm install serialport

FROM node:16-alpine

COPY --from=builder /makecode /makecode

RUN apk add --no-cache \
        python3 \
    && rm -rf /var/cache/apk/*

EXPOSE 3232 3233

CMD cd /makecode/pxt-microbit && pxt serve -h $(hostname -i) --no-browser
