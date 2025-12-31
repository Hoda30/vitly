#!/bin/bash

echo "Setting up VITLY Platform..."

# Copy .env.example to .env if it doesn't exist
if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created .env file. Please update it with your configuration."
fi

# Generate Prisma client
echo "Generating Prisma client..."
cd backend
npm install
npx prisma generate --schema=./prisma/schema.prisma
cd ..

# Install frontend dependencies
echo "Installing frontend dependencies..."
cd frontend
npm install
cd ..

echo "Setup complete!"
echo "Run 'docker-compose up --build' to start all services."






