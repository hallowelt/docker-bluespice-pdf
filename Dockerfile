FROM tomcat:10-jdk21-openjdk 
RUN wget https://buildservice.bluespice.com/webservices/REL1_39-4.3.x/BShtml2PDF.war -O $CATALINA_HOME/webapps/BShtml2PDF.war
RUN apt remove -y curl git openssh-client\