# Introduction

Hello
Im instentbanjo :)

I had a problem when trying to run microbit's [makecode](https://makecode.microbit.org) locally when using the Dockerfile from https://github.com/leejoneshane/docker-microbit. 

[This](https://github.com/microsoft/pxt-microbit/issues/4848), was not it. 

Then I found this https://github.com/microsoft/pxt-microbit/issues/2447 : The Solution

So now this is my version of implementing this solution ._.

# Docker
``` bash
docker run -d --name makecode-server-1.2 -p 3232:3232 -p 3233:3233 ghcr.io/instentbanjo/microbit-makecode-docker:1.2
```

