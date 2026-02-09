# Etapa de compilación
FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
# Forzamos permisos por si acaso
RUN chmod +x mvnw 
RUN ./mvnw clean package -DskipTests

# Etapa de ejecución
FROM eclipse-temurin:21-jre-jammy
COPY --from=build /target/*.jar app.jar
EXPOSE 8081
# Usamos formato shell para que las variables de Render se expandan
ENTRYPOINT java -Dspring.datasource.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}?sslMode=REQUIRED -Dserver.port=${PORT:8081} -jar app.jar
