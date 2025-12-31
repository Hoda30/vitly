#!/bin/bash

# VITLY Installation Script for Linux/Mac
echo "🚀 Starting VITLY Installation..."

# Check Node.js
echo ""
echo "📦 Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 20+ first."
    exit 1
fi
echo "✅ Node.js version: $(node --version)"

# Install Backend Dependencies
echo ""
echo "📦 Installing backend dependencies..."
cd backend
if [ -d "node_modules" ]; then
    echo "⚠️  Removing existing node_modules..."
    rm -rf node_modules
fi
npm install
if [ $? -ne 0 ]; then
    echo "❌ Backend installation failed!"
    cd ..
    exit 1
fi
echo "✅ Backend dependencies installed"

# Setup Backend Environment
if [ ! -f ".env" ]; then
    echo ""
    echo "📝 Creating backend .env file..."
    cp .env.example .env
    echo "✅ Created backend/.env - Please update it with your configuration"
else
    echo "✅ Backend .env already exists"
fi

# Generate Prisma Client
echo ""
echo "🔧 Generating Prisma client..."
npm run prisma:generate || echo "⚠️  Prisma generation failed, but continuing..."

cd ..

# Install Frontend Dependencies
echo ""
echo "📦 Installing frontend dependencies..."
cd frontend
if [ -d "node_modules" ]; then
    echo "⚠️  Removing existing node_modules..."
    rm -rf node_modules
fi
npm install
if [ $? -ne 0 ]; then
    echo "❌ Frontend installation failed!"
    cd ..
    exit 1
fi
echo "✅ Frontend dependencies installed"

# Setup Frontend Environment
if [ ! -f ".env.local" ]; then
    echo ""
    echo "📝 Creating frontend .env.local file..."
    if [ -f ".env.example" ]; then
        cp .env.example .env.local
        echo "✅ Created frontend/.env.local - Please update it with your configuration"
    else
        echo "⚠️  .env.example not found, skipping..."
    fi
else
    echo "✅ Frontend .env.local already exists"
fi

cd ..

echo ""
echo "✅ Installation Complete!"
echo ""
echo "📋 Next Steps:"
echo "1. Update backend/.env with your configuration"
echo "2. Update frontend/.env.local with your configuration"
echo "3. Setup database: cd backend && npm run prisma:migrate:dev"
echo "4. Seed database: cd backend && npm run prisma:seed"
echo "5. Start backend: cd backend && npm run start:dev"
echo "6. Start frontend: cd frontend && npm run dev"
echo ""
echo "🚀 Happy coding!"


