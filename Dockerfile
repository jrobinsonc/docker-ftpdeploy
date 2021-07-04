FROM alpine:latest

LABEL maintainer "jrobinsonc@gmail.com"

# Install required stuff give live to the image.
RUN apk update --no-cache \
  && apk upgrade --no-cache \
  && apk add --no-cache g++ make libffi-dev bash git libssh2-dev

# Build cURL with SFTP support.
RUN set -e \
  && mkdir /root/build \
  && cd /root/build \
  && wget https://curl.haxx.se/download/curl-7.77.0.tar.gz \
  && tar -zxvf curl-7.77.0.tar.gz \
  && cd curl-7.77.0 \
  && ./configure --with-libssh2=/usr/local --with-openssl --disable-dependency-tracking \
  && make \
  && make install \
  && rm -rf /root/build

# Install GIT FTP
RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
  && cd /opt/git-ftp \
  && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
  && git checkout "$tag" \
  && make install

CMD ["bash"]
