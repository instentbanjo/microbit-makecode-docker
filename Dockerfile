# Use a lightweight Node.js image
FROM node:16-alpine

# Set the working directory
WORKDIR /makecode

# Install dependencies and clone PXT Micro:bit repository
RUN apk add --no-cache \
        python3 \
        eudev-dev \
        linux-headers \
        build-base \
        git \
    && git clone --depth=1 https://github.com/microsoft/pxt-microbit.git \
    && cd pxt-microbit \
    && npm install -g pxt \
    && npm install \
    && npm install serialport

# Expose the ports used by the PXT server
EXPOSE 3232 3233

# Command to start the PXT server
CMD cd /makecode/pxt-microbit && pxt serve -h $(hostname -i) --no-browser
