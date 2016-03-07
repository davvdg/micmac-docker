FROM ubuntu
RUN mkdir /build
RUN apt-get update && apt-get install -y \
  make cmake \
  libproj-dev libimage-exiftool-perl exiv2 imagemagick proj-bin proj-data \
  libqt5gui5 libqt5core5a libqt5opengl5 libqt5widgets5 libqt5xml5 libicu52 \
  && apt-get remove --purge -y $BUILD_PACKAGES  && rm -rf /var/lib/apt/lists/*

  #software-properties-common build-essential ca-certificates git 
  #wget unzip libtool automake python-pip libpython-dev libjpeg-dev zlib1g-dev \


COPY micmac /micmac
RUN chmod +x /micmac/bin/* && chmod +x /micmac/binaire-aux/*
ENV PATH /micmac/bin:$PATH
