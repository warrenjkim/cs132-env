FROM openjdk:17-jdk-slim-buster
ARG GRADLE_VERSION=8.7
ARG JAVACC_VERSION=7.0.13

ARG UID=1000
ARG GID=998

RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/* \
    && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp \
    && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip \
    && wget https://github.com/javacc/javacc/archive/javacc-${JAVACC_VERSION}.zip -P /tmp \
    && unzip /tmp/javacc-${JAVACC_VERSION}.zip -d /opt \
    && rm /tmp/javacc-${JAVACC_VERSION}.zip \
    && wget https://repo1.maven.org/maven2/net/java/dev/javacc/javacc/${JAVACC_VERSION}/javacc-${JAVACC_VERSION}.jar -P /opt/javacc-javacc-${JAVACC_VERSION} \
    && mv /opt/javacc-javacc-${JAVACC_VERSION}/javacc-${JAVACC_VERSION}.jar /opt/javacc-javacc-${JAVACC_VERSION}/javacc.jar


ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV JAVACC_HOME=/opt/javacc-javacc-${JAVACC_VERSION}
ENV PATH=${JAVACC_HOME}/scripts:${GRADLE_HOME}/bin:${PATH}

RUN groupadd -g ${GID} cs132-env && useradd -m -u ${UID} -g cs132-env -s /bin/bash cs132-env

USER cs132-env

WORKDIR /cs132

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
