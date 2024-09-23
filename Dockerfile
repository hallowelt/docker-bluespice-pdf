FROM rapidfort/tomcat10-openjdk17-ib 
ADD --chown=tomcat:tomcat --checksum=sha256:19018d1078689d5602e0a3ebe3653a05c6c96b20156cf2db08fae068749186ae https://buildservice.bluespice.com/webservices/4.5.x/BShtml2PDF.war  /usr/local/tomcat/webapps/BShtml2PDF.war
