FROM ibmcom/ace
USER aceuser
COPY bars/ /home/aceuser/initial-config/bars/
COPY truststore.jks /home/aceuser/initial-config/truststore.jks
#COPY cert.arm /home/aceuser/initial-config/truststore/
COPY keystore.jks /home/aceuser/initial-config/keystore.jks
COPY odbc.ini /home/aceuser/initial-config/odbcini/
COPY setdbparms.txt /home/aceuser/initial-config/setdbparms/
#COPY initial-config/policy/* /home/aceuser/initial-config/policy/
COPY server.conf.yaml /home/aceuser/ace-server/server.conf.yaml
ENV ODBCINI /home/aceuser/initial-config/odbcini/odbc.ini
ENV ODBCSYSINI /home/aceuser/initial-config/odbcini/
WORKDIR /home/aceuser
USER root
RUN chown -R aceuser:mqbrkrs $ODBCINI && chmod 755 $ODBCINI
USER aceuser
