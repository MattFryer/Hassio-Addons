ARG BASE=mbentley/omada-controller:latest
FROM ${BASE}
HEALTHCHECK CMD wget --quiet --tries=1 --no-check-certificate http://127.0.0.1:8088 || exit 1

COPY install.sh healthcheck.sh entrypoint.sh /

RUN chmod +x /*.sh

# Copy configuration properties
COPY omada.properties log4j2.properties /opt/tplink/EAPController/properties/

EXPOSE 8043/tcp 8088/tcp 27001/udp 27002/tcp 29810/tcp 29810/udp 29811/tcp 29811/udp 29812/tcp 29812/udp 29813/tcp 29813/udp 29814/tcp 29814/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/java -server -Xms128m -Xmx1024m -XX:MaxHeapFreeRatio=60 -XX:MinHeapFreeRatio=30 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/tplink/EAPController/logs/java_heapdump.hprof -Djava.awt.headless=true -cp /opt/tplink/EAPController/lib/*::/opt/tplink/EAPController/properties: com.tplink.smb.omada.starter.OmadaLinuxMain"]
