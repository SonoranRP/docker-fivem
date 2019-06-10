FROM alpine:latest

RUN apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/1323-561e8b31438b85a7933ad753fdc420962c594e13/fx.tar.xz | tar xJ -C /srv
RUN wget https://github.com/TomGrobbe/vMenu/files/2985224/CitizenFX.Core.Server.zip -O /tmp/CitizenFX.Core.Server.zip
RUN unzip /tmp/CitizenFX.Core.Server.zip -d /srv/alpine/opt/cfx-server/citizen/clr2/lib/mono/4.5/

VOLUME ["/srv/cache", "/srv/resources"]
WORKDIR /srv

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "/srv/run.sh"]
CMD ["+exec", "/srv/server.cfg"]
