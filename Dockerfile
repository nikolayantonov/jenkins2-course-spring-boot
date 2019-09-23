FROM maven:3.6-jdk-8-slim
COPY . /repo
WORKDIR /repo/spring-boot-samples/spring-boot-sample-atmosphere
RUN mvn clean package

FROM openjdk:8-slim
COPY --from=0 /repo/spring-boot-samples/spring-boot-sample-atmosphere/target/spring-boot-sample-atmosphere-1.4.0.BUILD-SNAPSHOT.jar /app/atmosphere.jar
WORKDIR /app
CMD ["java", "-jar", "atmosphere.jar"]
