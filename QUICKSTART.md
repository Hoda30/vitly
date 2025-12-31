# VITLY Platform - Quick Start Guide

## Prerequisites
- Docker & Docker Compose
- Node.js 20+ (for local development)

## Quick Start

1. **Copy environment file:**
   ```bash
   cp .env.example .env
   ```

2. **Update `.env` with your configuration:**
   - Stripe keys (get from https://stripe.com)
   - Email credentials (for Nodemailer)
   - JWT secrets (generate strong random strings)

3. **Start all services:**
   ```bash
   docker-compose up --build
   ```

4. **Run database migrations:**
   ```bash
   docker-compose exec backend npm run prisma:migrate
   ```

5. **Seed the database:**
   ```bash
   docker-compose exec backend npm run prisma:seed
   ```

6. **Access the platform:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:3001
   - Database: localhost:5432

## Default Credentials

After seeding:
- **Admin**: admin@vitly.com / admin123
- **User**: user@vitly.com / user123

## Development

### Backend (Local)
```bash
cd backend
npm install
npm run prisma:generate
npm run start:dev
```

### Frontend (Local)
```bash
cd frontend
npm install
npm run dev
```

## Features

✅ Multilingual (EN/NL)  
✅ Product catalog  
✅ Shopping cart & checkout  
✅ Stripe payment integration  
✅ Blood test ordering & analysis  
✅ AI-powered supplement recommendations  
✅ Admin panel  
✅ GDPR compliant  
✅ Ultra-minimal design (White/Black/Red)

## API Endpoints

- `POST /api/auth/register` - Register user
- `POST /api/auth/login` - Login
- `GET /api/products` - List products
- `GET /api/products/:slug` - Get product
- `POST /api/orders` - Create order
- `GET /api/orders/me` - Get user orders
- `POST /api/blood-tests/order` - Order blood test
- `GET /api/blood-tests/me` - Get user blood tests
- `POST /api/ai/analyze-blood-test` - Analyze blood test

## Production Deployment

1. Update environment variables for production
2. Use production database
3. Configure Stripe webhooks
4. Set up SSL certificates
5. Configure email service
6. Run: `docker-compose -f docker-compose.yml up -d`






