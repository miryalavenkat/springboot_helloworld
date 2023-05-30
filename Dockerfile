FROM maven:3.6.3-adoptopenjdk-11 as base

# set working directory
WORKDIR /opt/demo

# copy project files
COPY . .

# compile the source code and package it in a jar file
RUN mvn clean package -Dmaven.test.skip=true


COPY ./target/example.smallest-0.0.1-SNAPSHOT.war /opt/demo


EXPOSE 9092

CMD ["java", "-jar", "example.smallest-0.0.1-SNAPSHOT.war"]
