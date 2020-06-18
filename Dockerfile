FROM oracle/graalvm-ce:20.1.0-java11 as build
WORKDIR build
ADD [".mvn", "./.mvn"]
ADD ["mvnw", "./mvnw"]
ADD ["src", "./src"]
ADD ["pom.xml", "./pom.xml"]
RUN echo "Installing GraalVM native image" && \
    gu install native-image && \
    echo "Building native image for the application" && \
    ./mvnw package -Pnative

#Create the final runner image
FROM oracle/graalvm-ce:20.1.0-java11

LABEL "maintainer"="Alexandro Blanco" \
      "description"="simple hello world application with quarkus framework"

COPY --from=build ["/build/target/app-runner", "/app/"]

WORKDIR /app

EXPOSE 8080

CMD ["/app/app-runner"]