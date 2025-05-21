# Use the official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy app code into the container
COPY app.js .

# Expose port the app runs on
EXPOSE 3000
