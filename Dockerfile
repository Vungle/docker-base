FROM alpine:3.3
RUN apk add --update -t deps \
  bash \
  curl \
  ca-certificates \
  htop \
  wget \
  && rm -rf /var/cache/apk/*
CMD ["/bin/bash"]

