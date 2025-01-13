FROM alpine:3.20
ARG USER
ENV USER=tomcat
ARG GID
ENV GID=$UID
ARG GROUPNAME
ENV GROUPNAME=$USER
RUN apk add openjdk21
ADD --checksum=sha256:f799541380bfff2b674cefd86c5376d2d7d566b3a2e7c4579d2b491de8ec6c36 https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz /opt/
RUN addgroup $GROUPNAME \
	&& adduser -G $GROUPNAME --disabled-password --gecos "" $USER \
    && cd /opt \
    && mkdir tomcat \
    && tar xzf apache-tomcat-10.1.34.tar.gz  -C tomcat --strip-components 1 \ 
    && chown -R tomcat:tomcat tomcat \
    && rm -fr apache-tomcat-10.1.34.tar.gz
ADD --chown=tomcat:tomcat --checksum=sha256:19018d1078689d5602e0a3ebe3653a05c6c96b20156cf2db08fae068749186ae https://buildservice.bluespice.com/webservices/4.5.x/BShtml2PDF.war  /opt/tomcat/webapps/BShtml2PDF.war
ENV JAVA_OPTS="-Xverify:none"
USER tomcat
EXPOSE 8080
ENTRYPOINT [ "/opt/tomcat/bin/catalina.sh","run" ]
