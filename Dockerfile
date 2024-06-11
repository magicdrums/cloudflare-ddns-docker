# https://www.linuxcontainers.dev
# Source repository: https://github.com/linuxcontainers/cloudflare-ddns-docker
# Source licensed under the MIT License: https://github.com/linuxcontainers/cloudflare-ddns-docker/blob/master/LICENSE

FROM alpine:latest

LABEL maintainer="peter@linuxcontainers.dev" \
    org.opencontainers.image.authors="Peter, peter@linuxcontainers.dev, https://www.linuxcontainers.dev/" \
    org.opencontainers.image.source="https://github.com/linuxcontainers/cloudflare-ddns-docker" \
    org.opencontainers.image.title="cloudflare-ddns-docker" 

RUN /sbin/apk update --no-cache \
    && /sbin/apk upgrade --no-cache \
    && /sbin/apk add bash curl --no-cache \
    && /bin/rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY cloudflare-ddns.sh /usr/local/bin/cloudflare-ddns.sh
RUN chmod +x /usr/local/bin/cloudflare-ddns.sh

CMD ["/bin/bash","/entrypoint.sh"]
