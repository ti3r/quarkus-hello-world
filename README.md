# Simple hello world with Quarkus

This project uses Quarkus, the Supersonic Subatomic Java Framework.

If you want to learn more about Quarkus, please visit its website: https://quarkus.io/ .

## Running the application in dev mode

You can run your application in dev mode that enables live coding using:
```
./mvnw quarkus:dev
```

## Packaging and running the application

The application can be packaged using `./mvnw package`.
It produces the `app-runner.jar` file in the `/target` directory.
Be aware that it’s not an _über-jar_ as the dependencies are copied into the `target/lib` directory.

The application is now runnable using `java -jar target/app-runner.jar`.

## Creating docker image

It uses Quarkus native capabilities and GraalVM in order to create a docker image with the executable. 

If you want to learn more about building native executables, please consult https://quarkus.io/guides/building-native-image.

You can build the image like this: 
```
docker build -t <image_tag> .
```