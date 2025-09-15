FROM eclipse-temurin:21-jre-alpine
ARG SHA256sum=16a4f982ec5c04c86f0311345f2a679b086865e70fe929d5675aa2271ed493ae
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.4/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
