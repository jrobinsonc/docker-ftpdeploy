FROM alpine:latest

LABEL maintainer "hi@joserobinson.com"

# Install required stuff give live to the image.
RUN apk update --no-cache \
  && apk upgrade --no-cache \
  && apk add --no-cache gcc g++ make libffi-dev openssl-dev bash git

# Build cURL with SFTP support.
RUN mkdir /root/build
RUN cd /root/build \
  && wget https://www.libssh2.org/download/libssh2-1.9.0.tar.gz \
  && tar -zxvf libssh2-1.9.0.tar.gz \
  && cd libssh2-1.9.0 \
  && ./configure \
  && make \
  && make install
RUN cd /root/build \
  && wget https://curl.haxx.se/download/curl-7.76.1.tar.gz \
  && tar -zxvf curl-7.76.1.tar.gz \
  && cd curl-7.76.1 \
  && ./configure --with-libssh2=/usr/local \
  && make \
  && make install
RUN rm -rf /root/build

# Install GIT FTP
RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
  && cd /opt/git-ftp \
  && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
  && git checkout "$tag" \
  && make install

CMD ["bash"]