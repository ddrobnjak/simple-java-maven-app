FROM maven:3.5-jdk-8-alpine as builder

COPY src /usr/src/app/src
COPY pom.xml /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8

COPY --from=builder /usr/src/app/target/my-app-1.0.jar /usr/app/my-app-1.0.jar

ENTRYPOINT ["java", "-cp", "/usr/app/my-app-1.0.jar", "com.mycompany.app.App"]
