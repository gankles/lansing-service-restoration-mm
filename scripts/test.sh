#!/bin/bash

# Test script to run inside Docker container
echo "Running tests in Docker environment..."

# Run linting
echo "Running ESLint..."
npm run lint

# Run type checking
echo "Running TypeScript checks..."
npx tsc --noEmit

# Run build test
echo "Testing build process..."
npm run build

echo "All tests completed!"