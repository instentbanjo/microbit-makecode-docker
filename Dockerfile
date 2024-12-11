FROM node:16-alpine

WORKDIR /makecode

RUN apk add --no-cache \
        python3 \
        git \
    && git clone --depth=1 https://github.com/microsoft/pxt-microbit.git \
    && cd pxt-microbit \
    && npm install -g pxt \
    && npm install \
    && npm install serialport \
    && npm cache clean --force \
    && apk del git \
    && rm -rf /var/cache/apk/* /tmp/* /root/.npm /root/.cache

EXPOSE 3232 3233

CMD cd /makecode/pxt-microbit && pxt serve -h $(hostname -i) --no-browser
