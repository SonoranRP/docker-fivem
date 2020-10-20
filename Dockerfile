FROM alpine:latest

RUN apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/2915-17937e54dae8ecbaa6f5ea9845906ae343e6c379/fx.tar.xz | 

VOLUME ["/srv/cache", "/srv/resources"]
WORKDIR /srv

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "/srv/run.sh"]
CMD ["+exec", "/srv/server.cfg"]
