FROM eclipse-temurin:21-jre-alpine
ARG SHA256sum=ec57cf7b6692cb76755db65c8f401f6a488885335cff96672f274ae56a294108
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.6/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
