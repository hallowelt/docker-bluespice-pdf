FROM eclipse-temurin:21-jre-alpine
ENV APP_PATH=/BShtml2PDF
ARG SHA256sum=15d17bc6fe6e463647063ba1db0f6bcad0736eeac53be8510e779da1750d0e1b
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.2/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
