FROM openjdk:8
COPY target/realtime-project-demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8888
ENTRYPOINT ["java","-jar","/app.jar"]
