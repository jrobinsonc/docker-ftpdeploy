FROM phusion/baseimage

LABEL maintainer "hi@joserobinson.com"

RUN export DEBIAN_FRONTEND=noninteractive

RUN add-apt-repository -y ppa:git-ftp/ppa \
    && apt-get update \
    && apt-get install -y git-ftp
