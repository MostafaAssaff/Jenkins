#!/bin/bash

echo "✅ Script execution started inside Jenkins container..."

# Try to update and install tools only if running as root
if [ "$(id -u)" -eq 0 ]; then
  echo "🔧 Root access detected. Updating system and installing required packages..."
  apt update && apt install -y \
    default-jdk \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    docker.io
else
  echo "⚠️ No root access. Cannot install packages or modify the system."
fi

# Check if Java is installed
if command -v java >/dev/null 2>&1; then
  echo "✅ Java is installed:"
  java -version
else
  echo "❌ Java is not installed"
fi

# Check if Docker is installed
if command -v docker >/dev/null 2>&1; then
  echo "✅ Docker is installed:"
  docker --version
else
  echo "❌ Docker is not installed"
fi

# Attempt to download Docker Compose if root access is available
if [ "$(id -u)" -eq 0 ]; then
  echo "🔧 Attempting to download Docker Compose..."
  curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
else
  echo "⚠️ No root access. Cannot download Docker Compose to /usr/local/bin"
fi

# Check if Docker Compose is installed
if command -v docker-compose >/dev/null 2>&1; then
  echo "✅ Docker Compose is installed:"
  docker-compose --version
else
  echo "❌ Docker Compose is not installed"
fi

echo "✅ Script finished."
