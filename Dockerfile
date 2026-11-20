# HTML2PDF_VERSION may be a tag, branch or commit of hallowelt/webservice-html2pdf.
FROM maven:3.9-eclipse-temurin-25 AS build
ARG HTML2PDF_VERSION=2.2.5
ADD https://github.com/hallowelt/webservice-html2pdf/archive/${HTML2PDF_VERSION}.tar.gz /tmp/html2pdf-source.tar.gz
RUN mkdir -p /usr/src/app && \
    tar -xzf /tmp/html2pdf-source.tar.gz --strip-components=1 -C /usr/src/app
WORKDIR /usr/src/app
RUN mvn --batch-mode -U clean package

FROM eclipse-temurin:25-jre-alpine
COPY --from=build /usr/src/app/target/html2pdf-*.jar /app/html2pdf.jar
RUN mkdir -p /tmp/.cache/fontconfig && \
    chgrp -R 0 /app /tmp/.cache && \
    chmod -R g=u /app /tmp/.cache

# Build info: value of build arg BUILDINFO, `-` if not set
ARG BUILDINFO
RUN mkdir -p /image && echo "${BUILDINFO:--}" > /image/BUILDINFO

ENV XDG_CACHE_HOME=/tmp/.cache
WORKDIR /app

EXPOSE 8080
USER 1000
CMD ["java", "-jar", "html2pdf.jar"]
