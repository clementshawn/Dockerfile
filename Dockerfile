From alpine:3.12

LABEL maintainer="clementshawn28@gmail.com"
LABEL description="This image is build from official GA binary."

ENV YEARNING_VERSION=2.3.1

COPY conf.toml /opt/conf.toml

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache tzdata libc6-compat \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && apk add --no-cache --virtual .build-deps curl \
    && curl -fsSLO --compressed "https://github.com/cookieY/Yearning/releases/download/v$YEARNING_VERSION/Yearning-$YEARNING_VERSION-GA-linux-amd64.zip" \
    && unzip "Yearning-$YEARNING_VERSION-GA-linux-amd64.zip" \
    && cp Yearning-go/Yearning /opt/Yearning \
    && rm -Rf Yearning-go \
    && rm Yearning-$YEARNING_VERSION-GA-linux-amd64.zip

WORKDIR /opt

EXPOSE 8000

ENTRYPOINT ["/opt/Yearning"]

CMD ["-m", "-s"]