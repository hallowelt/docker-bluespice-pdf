FROM eclipse-temurin:21-jre-alpine
ARG SHA256sum=679c492788b3372d6e36b021452d89dc39287e2eb688407bdb7114729831e40b
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.3/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
