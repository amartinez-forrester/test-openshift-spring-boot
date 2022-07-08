#  ╔╗ ╦ ╦╦╦  ╔╦╗  ╔═╗╔╦╗╔═╗╔═╗╔═╗
#  ╠╩╗║ ║║║   ║║  ╚═╗ ║ ╠═╣║ ╦║╣
#  ╚═╝╚═╝╩╩═╝═╩╝  ╚═╝ ╩ ╩ ╩╚═╝╚═╝
# syntax=docker/dockerfile:experimental
FROM maven:3.8.1-amazoncorretto-11 as build-stage

ARG MAVEN_OPTS="-Dmaven.artifact.threads=100"
ENV MAVEN_OPTS="${MAVEN_OPTS}"

# copy the Project Object Model file
COPY ["pom.xml", "/usr/src/openshift-demo/pom.xml"]

WORKDIR /usr/src/openshift-demo

# fetch all dependencies
RUN mvn dependency:go-offline -B

# copy your other files
COPY [".", "/usr/src/openshift-demo"]

RUN mvn -DskipTests=true package

RUN ls /usr/src/openshift-demo/target/

#  ╔═╗╦═╗╔═╗╔╦╗╦ ╦╔═╗╔╦╗╦╔═╗╔╗╔  ╔═╗╔╦╗╔═╗╔═╗╔═╗
#  ╠═╝╠╦╝║ ║ ║║║ ║║   ║ ║║ ║║║║  ╚═╗ ║ ╠═╣║ ╦║╣
#  ╩  ╩╚═╚═╝═╩╝╚═╝╚═╝ ╩ ╩╚═╝╝╚╝  ╚═╝ ╩ ╩ ╩╚═╝╚═╝
FROM amazoncorretto:11 as production-stage

RUN yum install -y iputils nmap

RUN mkdir -p /deploy

COPY --from=build-stage /usr/src/openshift-demo/target/*.jar /deploy/openshift-demo.jar

WORKDIR /deploy

CMD java -jar openshift-demo.jar