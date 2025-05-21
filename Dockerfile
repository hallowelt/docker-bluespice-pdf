FROM eclipse-temurin:21-jre-alpine
ARG SHA256sum=e8cc9bc7907ea694f7cdceb3cfa776c37b451b289e44e5ac09e7be30acc3d44d
ADD --checksum=sha256:$SHA256sum https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.0/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
