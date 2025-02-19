FROM openjdk:8-jdk-alpine3.7 AS builder
RUN java -version

COPY . /usr/src/myapp/
WORKDIR /usr/src/myapp/
RUN apk --no-cache add maven && mvn --version
RUN mvn package
RUN javac -cp Pandas/target/Pandas-1.0-SNAPSHOT.jar ExampleDataframe.java

CMD java ExampleDataframe