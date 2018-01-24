FROM alpine:edge

RUN apk add --no-cache --update shadow bash xpra py2-pip xterm && \
    pip install websockify lz4 && \
    cp /etc/xpra/xorg.conf /etc/X11/xorg.conf.d/00_xpra.conf && \
    adduser -D -s /bin/bash user && \
    mkdir -p /run/user/1000 /run/xpra && chown user /run/user/1000 /run/xpra && \
    echo "xvfb=Xorg -dpi 96 -noreset -nolisten tcp +extension GLX +extension RANDR +extension RENDER" >> /etc/xpra/xpra.conf

RUN apk add --no-cache --update py-netifaces

EXPOSE 10000

USER user
CMD xpra start --html=on --daemon=no --notifications=no --dbus-proxy=no --mdns=no --bind-tcp=0.0.0.0:10000 --start-child=xterm --exit-with-children
