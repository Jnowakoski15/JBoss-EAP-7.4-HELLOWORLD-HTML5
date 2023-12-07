# Use a JBoss EAP 7.4 image as the base
FROM registry.redhat.io/jboss-eap-7/eap74-openjdk11-openshift-rhel8:7.4.14-5

# Copy your application WAR file to the deployments directory
COPY target/helloworld-html5.war $JBOSS_HOME/standalone/deployments/

USER root 
RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/helloworld-html5.war 

EXPOSE 8080

# Set the JBoss application name (optional)
ENV JBOSS_SERVER_NAME Hello World

USER jboss