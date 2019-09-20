FROM alpine:latest

RUN apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/1610-fa9a5483690720b55697788fbc75380b9928c6ce/fx.tar.xz | 

VOLUME ["/srv/cache", "/srv/resources"]
WORKDIR /srv

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "/srv/run.sh"]
CMD ["+exec", "/srv/server.cfg"]
