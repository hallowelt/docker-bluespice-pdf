FROM alpine:3.20
ARG USER
ENV USER=tomcat
ARG UID=1000
ARG GID
ENV GID=$UID
ARG GROUPNAME
ENV GROUPNAME=$USER
RUN apk add openjdk21
ADD --checksum=sha256:25f1e607f17ee2fa99e329eec23b6393ab9e1390929c6cdcb31f749576b94d8e https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.40/bin/apache-tomcat-10.1.40.tar.gz /opt 
RUN addgroup $GROUPNAME \
	&& adduser -G $GROUPNAME --disabled-password --gecos "" $USER \
    && cd /opt \
    && mkdir tomcat \
    && tar xzf apache-tomcat-10.1.40.tar.gz  -C tomcat --strip-components 1 \ 
    && chown -R tomcat:tomcat tomcat \
    && rm -fr apache-tomcat-10.1.40.tar.gz
ADD --chown=tomcat:tomcat --checksum=sha256:19018d1078689d5602e0a3ebe3653a05c6c96b20156cf2db08fae068749186ae https://buildservice.bluespice.com/webservices/4.5.x/BShtml2PDF.war  /opt/tomcat/webapps/BShtml2PDF.war
ENV JAVA_OPTS="-Xverify:none"
USER tomcat
EXPOSE 8080
ENTRYPOINT [ "/opt/tomcat/bin/catalina.sh","run" ]
