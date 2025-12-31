# PowerShell setup script for VITLY Platform

Write-Host "Setting up VITLY Platform..." -ForegroundColor Green

# Copy .env.example to .env if it doesn't exist
if (-not (Test-Path .env)) {
    Copy-Item .env.example .env
    Write-Host "Created .env file. Please update it with your configuration." -ForegroundColor Yellow
}

# Generate Prisma client
Write-Host "Generating Prisma client..." -ForegroundColor Green
Set-Location backend
npm install
npx prisma generate --schema=./prisma/schema.prisma
Set-Location ..

# Install frontend dependencies
Write-Host "Installing frontend dependencies..." -ForegroundColor Green
Set-Location frontend
npm install
Set-Location ..

Write-Host "Setup complete!" -ForegroundColor Green
Write-Host "Run 'docker-compose up --build' to start all services." -ForegroundColor Cyan






