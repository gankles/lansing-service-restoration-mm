#!/bin/bash

# Project Structure Checker
echo "🔍 Checking project structure..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ ERROR: package.json not found in current directory"
    echo "   Make sure you're in the project root"
    exit 1
fi

# Check for nested project directories
NESTED_DIRS=$(find . -name "lansing-service-restoration-mm" -type d -not -path "./node_modules/*" | grep -v "^\.$")
if [ ! -z "$NESTED_DIRS" ]; then
    echo "❌ WARNING: Found nested project directories:"
    echo "$NESTED_DIRS"
    echo "   These should be flattened to the root directory"
    exit 1
fi

# Check for multiple package.json files
PKG_COUNT=$(find . -name "package.json" -not -path "./node_modules/*" | wc -l)
if [ "$PKG_COUNT" -gt 1 ]; then
    echo "❌ WARNING: Found multiple package.json files:"
    find . -name "package.json" -not -path "./node_modules/*"
    echo "   There should only be one in the root directory"
    exit 1
fi

# Check if essential files are in root
ESSENTIAL_FILES=("Dockerfile" "docker-compose.yml" "package.json" "next.config.mjs")
for file in "${ESSENTIAL_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ ERROR: Essential file '$file' not found in root"
        exit 1
    fi
done

echo "✅ Project structure looks good!"
echo "📁 Root directory contains all essential files"
echo "🐳 Docker configuration is properly located"
echo "📦 Package.json is in the correct location"