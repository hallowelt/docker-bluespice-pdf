FROM eclipse-temurin:21-jre-alpine
ARG SHA256sum=0d05f896ba39dd46ba2adcf6c3cf5972911a852fd89882d792c7b5b409856d39
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.1.0/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
