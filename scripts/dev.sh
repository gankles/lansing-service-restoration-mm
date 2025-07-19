#!/bin/bash

# Development startup script
echo "Starting development environment..."

# Build and start development containers
docker-compose up --build

# Keep script running to monitor logs
echo "Development environment is running. Press Ctrl+C to stop."
docker-compose logs -f