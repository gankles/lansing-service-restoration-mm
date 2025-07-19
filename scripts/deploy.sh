#!/bin/bash

# Production deployment script for AWS/Digital Ocean
echo "Starting production deployment..."

# Build production image
docker-compose -f docker-compose.prod.yml build

# Run production containers
docker-compose -f docker-compose.prod.yml up -d

# Check health
echo "Checking application health..."
sleep 10
curl -f http://localhost:3000 || exit 1

echo "Deployment completed successfully!"