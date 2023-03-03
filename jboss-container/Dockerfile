# Dockerfile for JBoss EAP 6.4 in standalone mode
FROM registry.access.redhat.com/ubi8/openjdk-8:1.10-1
USER root
# Copy the JBoss EAP 6.4 distribution to the container
COPY jboss-eap-6.4.0.zip /tmp/

# Unzip the JBoss EAP 6.4 distribution and remove the zip file
RUN unzip -q /tmp/jboss-eap-6.4.0.zip -d /opt && \
    rm -rf /tmp/jboss-eap-6.4.0.zip && \
    chown -R jboss:jboss /opt/jboss-eap-6.4

# Set the working directory to the JBoss EAP home folder
WORKDIR /opt/jboss-eap-6.4

# Set the JBoss EAP 6.4 standalone configuration
ENV JBOSS_HOME /opt/jboss-eap-6.4
ENV LAUNCH_JBOSS_IN_BACKGROUND true
ENV JAVA_OPTS "-Djboss.server.default.config=standalone.xml"

# Add a user for the JBoss EAP console
RUN ${JBOSS_HOME}/bin/add-user.sh admin '@4dm1i770' --silent

# Expose the necessary ports
EXPOSE 8080 8443 9990

# Start JBoss EAP 6.4 as the jboss user in standalone mode
USER jboss
CMD ${JBOSS_HOME}/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
