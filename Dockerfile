# Use the official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy app code into the container
COPY app.js .

# Expose port the app runs on
EXPOSE 3000

# Start the app
CMD ["node", "app.js"]FROM openjdk:9
ADD target/my-maven-docker-project.jar my-maven-docker-project.jar
ADD agent.sh .
ENTRYPOINT ["java", "-jar","my-maven-docker-project.jar"]
