FROM dockerfile/java:oracle-java8
MAINTAINER Nikolay Glushchenko <nick@nickalie.com>
ENV SMARTFOX_VERSION 2_9_0_64
WORKDIR /var
RUN wget http://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
  tar xf SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
	rm SFS2X_unix_${SMARTFOX_VERSION}.tar.gz
WORKDIR /var/SmartFoxServer_2X/SFS2X
# to properly initialize JVM for SmartFox Server
RUN ./sfs2x-service start && ./sfs2x-service stop 2> /dev/null
CMD ./sfs2x.sh
EXPOSE 8080 9933
