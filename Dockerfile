FROM openjdk:11.0.16-jdk

WORKDIR /usr/src/certificates

COPY ./certificates .

RUN $JAVA_HOME/bin/keytool -import -alias Root -keystore $JAVA_HOME/lib/security/cacerts -trustcacerts -file ./SSSS-Root-Certificate-Authority.cer -storepass changeit -noprompt

RUN $JAVA_HOME/bin/keytool -import -alias Intermediate -keystore $JAVA_HOME/lib/security/cacerts -trustcacerts -file ./SSSS-Intermediate-Certificate-Authority.cer -storepass changeit -noprompt

RUN apt-get update -y && \
    apt-get install -y maven