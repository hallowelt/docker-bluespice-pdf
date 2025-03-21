FROM eclipse-temurin:21-jre-alpine
ADD https://github.com/hallowelt/webservice-html2pdf/releases/download/1.0.0/html2pdf.jar /app/html2pdf.jar
WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "html2pdf.jar"]
