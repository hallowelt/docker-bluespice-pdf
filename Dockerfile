FROM eclipse-temurin:21-jre-alpine
ARG SHA256sum=25102e5f1431624596606624aebcea9add6f9d4b85ad592647657587b124062c
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.1/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
