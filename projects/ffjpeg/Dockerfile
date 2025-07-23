FROM gcr.m.daocloud.io/oss-fuzz-base/base-builder

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  cmake ninja-build ruby-full && \
  apt-get clean

RUN git clone --depth 1 \
  https://github.com/rockcarry/ffjpeg.git


COPY Makefile $SRC/ffjpeg/src

WORKDIR ffjpeg
COPY build.sh $SRC/
COPY *.cpp $SRC/ffjpeg/src
