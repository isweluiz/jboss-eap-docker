# Dockerfile for the war application
FROM jboss

# Copy the war application to the JBoss EAP 6.4 deployments directory
COPY development.war $JBOSS_HOME/standalone/deployments/
