FROM smebberson/alpine-openjdk
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# original sample from https://github.com/deis/example-java-jetty

# NOTE: This example actually builds the Java application with Maven, which means that the
#       final image includes both build and runtime dependencies - this is not meant as a
#       production-ready example.

RUN MAVEN_VERSION=3.3.9 \
 && cd /usr/share \
 && wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O - | tar xzf - \
 && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
 && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

ADD root /

RUN cd /app && mvn -V -U -B -DskipTests clean dependency:list install

CMD ["/app/start"]
