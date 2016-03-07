FROM ubuntu
RUN mkdir /build
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 16126D3A3E5C1192    \
  && apt-get update && apt-get install -y --fix-missing --no-install-recommends software-properties-common build-essential ca-certificates git make cmake wget unzip libtool automake python-pip libpython-dev libjpeg-dev zlib1g-dev \
  libproj-dev libimage-exiftool-perl exiv2 imagemagick \
  libqt5gui5 libqt5core5a libqt5opengl5 libqt5widgets5 libqt5xml5 libicu52 \
  && apt-get remove --purge -y $BUILD_PACKAGES  && rm -rf /var/lib/apt/lists/*

RUN mkdir /vdatum \
    && cd /vdatum \
    && wget http://download.osgeo.org/proj/vdatum/usa_geoid2012.zip && unzip -j -u usa_geoid2012.zip -d /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/usa_geoid2009.zip && unzip -j -u usa_geoid2009.zip -d /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/usa_geoid2003.zip && unzip -j -u usa_geoid2003.zip -d /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/usa_geoid1999.zip && unzip -j -u usa_geoid1999.zip -d /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/vertcon/vertconc.gtx && mv vertconc.gtx /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/vertcon/vertcone.gtx && mv vertcone.gtx /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/vertcon/vertconw.gtx && mv vertconw.gtx /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/egm96_15/egm96_15.gtx && mv egm96_15.gtx /usr/share/proj \
    && wget http://download.osgeo.org/proj/vdatum/egm08_25/egm08_25.gtx && mv egm08_25.gtx /usr/share/proj \
    && rm -rf /vdatum

COPY micmac /micmac
RUN chmod +x /micmac/bin/*
ENV PATH /micmac/bin:$PATH
