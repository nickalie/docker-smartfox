FROM dockerfile/java:oracle-java7
MAINTAINER Nikolay Glushchenko <nick@nickalie.com>
ENV SMARTFOX_VERSION 2_9_0_64
WORKDIR /var
RUN wget http://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz
RUN tar xf SFS2X_unix_${SMARTFOX_VERSION}.tar.gz
RUN rm SFS2X_unix_${SMARTFOX_VERSION}.tar.gz
WORKDIR /var/SmartFoxServer_2X/SFS2X
RUN ./sfs2x-service start && ./sfs2x-service stop 2> /dev/null
CMD ./sfs2x.sh
EXPOSE 8080 9933
