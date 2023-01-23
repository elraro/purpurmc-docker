FROM eclipse-temurin:19.0.1_10-jre
WORKDIR /opt/
RUN apt-get update && apt-get install -y wget && apt-get clean
COPY setup.sh /opt/
ENV MEMORY=8G
ENV VERSION=1.19.3
ENTRYPOINT ["/bin/sh", "setup.sh"]
