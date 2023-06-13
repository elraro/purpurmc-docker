FROM eclipse-temurin:eclipse-temurin:20-jre
WORKDIR /opt/
RUN apt-get update && apt-get install -y wget && apt-get clean
COPY setup.sh /opt/
ENV MEMORY=8G
ENV VERSION=1.20
ENTRYPOINT ["/bin/sh", "setup.sh"]
