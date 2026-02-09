# Etapa de compilación
FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
# Damos permisos de ejecución al wrapper
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Etapa de ejecución
FROM eclipse-temurin:21-jre-jammy
COPY --from=build /target/*.jar app.jar
EXPOSE 8080
# Formato limpio: Spring Boot leerá las variables de Render automáticamente
ENTRYPOINT ["java", "-jar", "app.jar"]