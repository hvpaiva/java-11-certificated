FROM openjdk:11.0.16-jdk

WORKDIR /usr/src/

COPY ./certicates .

RUN $JAVA_HOME/bin/keytool -import -alias Root -keystore $JAVA_HOME/lib/security/cacerts -trustcacerts -file ./certificates/SSSS-Root-Certificate-Authority.cer -storepass changeit -noprompt

RUN $JAVA_HOME/bin/keytool -import -alias Intermediate -keystore $JAVA_HOME/lib/security/cacerts -trustcacerts -file ./certificates/SSSS-Intermediate-Certificate-Authority.cer -storepass changeit -noprompt

