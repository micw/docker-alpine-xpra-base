This is a base image for dockerized remote applications using Xpra on alpine linux.

Just add your applications and modify the CMD.

The CMD with this image starts xterm in seamless mode:

```
CMD xpra start --html=on --daemon=no --notifications=no --mdns=no --bind-tcp=0.0.0.0:10000 --start-child=xterm --exit-with-children
```
