FROM openjdk:8-jdk
ENV GRADLE_VERSION=8.7

RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/* \
    && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp \
    && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=${GRADLE_HOME}/bin:${PATH}

WORKDIR /cs132

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
