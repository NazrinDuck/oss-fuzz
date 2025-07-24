FROM gcr.m.daocloud.io/oss-fuzz-base/base-builder
#FROM gcr.io/oss-fuzz-base/base-builder

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  cmake && \
  apt-get clean

RUN git clone --depth 1 \
  https://github.com/d99kris/rapidcsv

WORKDIR rapidcsv
COPY build.sh $SRC/
COPY *.cpp $SRC/rapidcsv
