FROM debian:wheezy

MAINTAINER Tim Pouyer <tpouyer@us.ibm.com>

# Pass in the location of the java-jre*.tgz artifact 
ARG ARTIFACT_DOWNLOAD_URL
ARG ARTIFACT_VERSION

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y --no-install-recommends net-tools curl wget bzip2 unzip xz-utils ca-certificates && \
	mkdir -p /opt/java && \
	wget -O - $ARTIFACT_DOWNLOAD_URL | tar zxf - -C /opt/java/ && \
	apt-get clean -y && \
	apt-get autoclean -y && \
	apt-get autoremove -y && \
	rm -rf /tmp/ibm-java-jre-$ARTIFACT_VERSION-linux-x86_64.tgz /var/lib/apt/lists/*

ENV JAVA_HOME=/opt/java/ibm-java-x86_64-71/jre \
	PATH=$JAVA_HOME/bin:$PATH

ENTRYPOINT ["/opt/java/ibm-java-x86_64-71/jre/bin/java"]
CMD []