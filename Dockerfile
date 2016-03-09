FROM debian:latest

ADD artifacts/ibm-java-x86_64-71 /opt/java/ibm-java-x86_64-71

ENV JAVA_HOME /opt/java/ibm-java-x86_64-71/jre
ENV PATH $JAVA_HOME/bin:$PATH

ENTRYPOINT ["/opt/java/ibm-java-x86_64-71/jre/bin/java"]
CMD [""]