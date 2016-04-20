FROM alpine:3.3
RUN apk add --update -t deps \
  curl \
  ca-certificates \
  git \
  htop \
  python \
  py-pip \
  wget \
  && rm -rf /var/cache/apk/*
RUN pip install s3cmd
CMD ["/bin/bash"]

