#!/bin/bash
set -e  # Exit on any error

echo "🧪 Running config tests..."

# Test 1: Check if config.txt exists
if [ ! -f app/config.txt ]; then
    echo "❌ ERROR: app/config.txt is missing!"
    exit 1
fi

# Test 2: Check if VERSION is set to 1.0
if ! grep -q "VERSION=1.0" app/config.txt; then
    echo "❌ ERROR: VERSION is not 1.0 in config.txt!"
    exit 1
fi

# Test 3: Check if DEBUG is false
if ! grep -q "DEBUG=false" app/config.txt; then
    echo "❌ ERROR: DEBUG is not false in config.txt!"
    exit 1
fi

# Test 4: Check if README.md mentions version
if ! grep -q "VERSION: 1.0" app/README.md; then
    echo "❌ ERROR: README.md does not mention version 1.0!"
    exit 1
fi

echo "✅ All tests passed!"
