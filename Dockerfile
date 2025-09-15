FROM eclipse-temurin:21-jre-alpine
ARG SHA256sum=29229c8427a9f63c28c087f7313d15bafbf0c46e32c8268a86a51fbbd695ba95
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.5/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
