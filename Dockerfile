FROM alpine:3.14

COPY bin/test-demo /usr/local/bin/test-demo
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && apk upgrade && apk add --no-cache git vim bash curl wget bash-doc bash-completion  && \
    sed -i "s#root:x:0:0:root:/root:/bin/ash#root:x:0:0:root:/root:/bin/bash#g" /etc/passwd
CMD [ "test-demo" ]