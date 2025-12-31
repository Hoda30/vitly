# VITLY Installation Script for Windows
Write-Host "🚀 Starting VITLY Installation..." -ForegroundColor Green

# Check Node.js
Write-Host "`n📦 Checking Node.js..." -ForegroundColor Yellow
$nodeVersion = node --version
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Node.js is not installed. Please install Node.js 20+ first." -ForegroundColor Red
    exit 1
}
Write-Host "✅ Node.js version: $nodeVersion" -ForegroundColor Green

# Install Backend Dependencies
Write-Host "`n📦 Installing backend dependencies..." -ForegroundColor Yellow
Set-Location backend
if (Test-Path "node_modules") {
    Write-Host "⚠️  node_modules exists, removing..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force node_modules
}
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Backend installation failed!" -ForegroundColor Red
    Set-Location ..
    exit 1
}
Write-Host "✅ Backend dependencies installed" -ForegroundColor Green

# Setup Backend Environment
if (-not (Test-Path ".env")) {
    Write-Host "`n📝 Creating backend .env file..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "✅ Created backend/.env - Please update it with your configuration" -ForegroundColor Green
} else {
    Write-Host "✅ Backend .env already exists" -ForegroundColor Green
}

# Generate Prisma Client
Write-Host "`n🔧 Generating Prisma client..." -ForegroundColor Yellow
npm run prisma:generate
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  Prisma generation failed, but continuing..." -ForegroundColor Yellow
}

Set-Location ..

# Install Frontend Dependencies
Write-Host "`n📦 Installing frontend dependencies..." -ForegroundColor Yellow
Set-Location frontend
if (Test-Path "node_modules") {
    Write-Host "⚠️  node_modules exists, removing..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force node_modules
}
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Frontend installation failed!" -ForegroundColor Red
    Set-Location ..
    exit 1
}
Write-Host "✅ Frontend dependencies installed" -ForegroundColor Green

# Setup Frontend Environment
if (-not (Test-Path ".env.local")) {
    Write-Host "`n📝 Creating frontend .env.local file..." -ForegroundColor Yellow
    if (Test-Path ".env.example") {
        Copy-Item ".env.example" ".env.local"
        Write-Host "✅ Created frontend/.env.local - Please update it with your configuration" -ForegroundColor Green
    } else {
        Write-Host "⚠️  .env.example not found, skipping..." -ForegroundColor Yellow
    }
} else {
    Write-Host "✅ Frontend .env.local already exists" -ForegroundColor Green
}

Set-Location ..

Write-Host "`n✅ Installation Complete!" -ForegroundColor Green
Write-Host "`n📋 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Update backend/.env with your configuration" -ForegroundColor White
Write-Host "2. Update frontend/.env.local with your configuration" -ForegroundColor White
Write-Host "3. Setup database: cd backend && npm run prisma:migrate:dev" -ForegroundColor White
Write-Host "4. Seed database: cd backend && npm run prisma:seed" -ForegroundColor White
Write-Host "5. Start backend: cd backend && npm run start:dev" -ForegroundColor White
Write-Host "6. Start frontend: cd frontend && npm run dev" -ForegroundColor White
Write-Host "`n🚀 Happy coding!" -ForegroundColor Green


