# Stage 1: Build the Angular frontend
FROM node:20-alpine AS frontend-build
WORKDIR /frontend
COPY frontend/package*.json ./
RUN npm ci --prefer-offline --no-audit
COPY frontend/ ./
RUN npm run build

# Stage 2: Build the Spring Boot backend
FROM maven:3.9.6-eclipse-temurin-21-alpine AS backend-build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
# Le dossier static/ versionne contient un ancien front vanilla JS et des bundles main-*.js
# perimes : on repart uniquement du build Angular frais.
RUN rm -rf src/main/resources/static
# Copy the compiled Angular frontend to static resources of Spring Boot
COPY --from=frontend-build /frontend/dist/frontend/browser/ src/main/resources/static/
RUN mvn clean package -DskipTests

# Stage 3: Runtime stage
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=backend-build /app/target/*.jar crm.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "crm.jar"]
