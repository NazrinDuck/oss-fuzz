FROM gcr.m.daocloud.io/oss-fuzz-base/base-builder
#FROM gcr.io/oss-fuzz-base/base-builder

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  libsdl-dev && \
  apt-get clean

RUN git clone --depth 1 \
  https://github.com/miniupnp/ngiflib.git


COPY Makefile $SRC/ngiflib

WORKDIR ngiflib
COPY build.sh $SRC/
COPY *.cpp $SRC/ngiflib
