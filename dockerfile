eclipse-temurin:17-jre
WORKDIR /app
COPY target/hello-world-java-1.0-SNAPSHOT.jar /app/hello-world-java-1.0-SNAPSHOT.jar
EXPOSE 8081
CMD ["java", "-jar", "hello-world-java-1.0-SNAPSHOT.jar"]
