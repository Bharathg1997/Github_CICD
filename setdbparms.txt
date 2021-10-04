FROM ibmcom/ace
USER aceuser
COPY bars /home/aceuser/initial-config/bars/
COPY initial-config/odbcini/* /home/aceuser/initial-config/odbcini/
COPY initial-config/setdbparms/* /home/aceuser/initial-config/setdbparms/
#COPY initial-config/policy/* /home/aceuser/initial-config/policy/
COPY initial-config/serverconf/* /home/aceuser/ace-server/overrides/server.cnf.yaml
ENV ODBCINI /home/aceuser/initial-config/odbcini/odbc.ini
ENV ODBCSYSINI /home/aceuser/initial-config/odbcini/
WORKDIR /home/aceuser
USER root
RUN chown -R aceuser:mqbrkrs $ODBCINI && chmod 755 $ODBCINI
USER aceuser
