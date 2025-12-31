# VITLY - Health & Wellness E-Commerce Platform

A modern, full-stack e-commerce platform for health supplements with AI-powered blood test analysis and personalized recommendations.

## 🚀 Features

- ✅ **Full E-Commerce Platform** - Product catalog, shopping cart, and checkout
- ✅ **Stripe Payment Integration** - Secure payment processing
- ✅ **Blood Test Ordering** - Order and track blood tests
- ✅ **AI-Powered Analysis** - Get personalized supplement recommendations based on blood test results
- ✅ **Multilingual Support** - English and Dutch (EN/NL)
- ✅ **Admin Panel** - Manage products, orders, and users
- ✅ **User Authentication** - JWT-based auth with refresh tokens
- ✅ **Modern UI** - Ultra-minimal design (White/Black/Red theme)
- ✅ **GDPR Compliant** - Privacy-focused architecture

## 🛠️ Tech Stack

### Backend
- **NestJS** - Progressive Node.js framework
- **Prisma** - Next-generation ORM
- **PostgreSQL** - Database
- **JWT** - Authentication
- **Stripe** - Payment processing
- **Nodemailer** - Email service

### Frontend
- **Next.js 14** - React framework with App Router
- **TypeScript** - Type safety
- **Tailwind CSS** - Styling
- **Redux Toolkit** - State management
- **React i18next** - Internationalization
- **Axios** - HTTP client

## 📋 Prerequisites

- **Node.js** 20+ 
- **npm** or **yarn**
- **PostgreSQL** 15+ (or Docker)
- **Stripe Account** (for payments)

## 🚀 Quick Start

### Option 1: Docker (Recommended)

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd vitly
   ```

2. **Create environment file:**
   ```bash
   # Copy backend environment
   cp backend/.env.example backend/.env
   
   # Copy frontend environment
   cp frontend/.env.example frontend/.env
   ```

3. **Update `.env` files** with your configuration:
   - Stripe keys (get from https://stripe.com)
   - Email credentials (for Nodemailer)
   - JWT secrets (generate strong random strings)

4. **Start all services:**
   ```bash
   docker-compose up --build
   ```

5. **Run database migrations:**
   ```bash
   docker-compose exec backend npm run prisma:migrate
   ```

6. **Seed the database:**
   ```bash
   docker-compose exec backend npm run prisma:seed
   ```

7. **Access the platform:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:3001
   - Database: localhost:5432

### Option 2: Local Development

#### Backend Setup

1. **Navigate to backend:**
   ```bash
   cd backend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Create `.env` file:**
   ```bash
   cp .env.example .env
   ```
   Update with your configuration.

4. **Generate Prisma client:**
   ```bash
   npm run prisma:generate
   ```

5. **Run migrations:**
   ```bash
   npm run prisma:migrate:dev
   ```

6. **Seed database (optional):**
   ```bash
   npm run prisma:seed
   ```

7. **Start development server:**
   ```bash
   npm run start:dev
   ```

Backend will run on http://localhost:3001

#### Frontend Setup

1. **Navigate to frontend:**
   ```bash
   cd frontend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Create `.env.local` file:**
   ```bash
   cp .env.example .env.local
   ```
   Update with your configuration.

4. **Start development server:**
   ```bash
   npm run dev
   ```

Frontend will run on http://localhost:3000

## 🔐 Default Credentials

After seeding the database:
- **Admin**: admin@vitly.com / 
- **User**: user@vitly.com /

⚠️ **Change these in production!**

## 📡 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/refresh` - Refresh access token
- `POST /api/auth/logout` - Logout user

### Products
- `GET /api/products` - List all products
- `GET /api/products/:slug` - Get product by slug
- `POST /api/products` - Create product (Admin only)
- `PATCH /api/products/:id` - Update product (Admin only)
- `DELETE /api/products/:id` - Delete product (Admin only)

### Orders
- `POST /api/orders` - Create order
- `GET /api/orders/me` - Get user's orders
- `GET /api/orders/:id` - Get order details
- `POST /api/orders/webhook` - Stripe webhook handler

### Blood Tests
- `POST /api/blood-tests/order` - Order blood test
- `GET /api/blood-tests/me` - Get user's blood tests
- `GET /api/blood-tests/:id` - Get blood test details

### AI Analysis
- `POST /api/ai/analyze-blood-test` - Analyze blood test and get recommendations

### Users
- `GET /api/users/me` - Get current user profile
- `PATCH /api/users/me` - Update user profile

## 🗄️ Database Schema

The project uses Prisma ORM. See `backend/prisma/schema.prisma` for the complete schema.

Key models:
- **User** - User accounts with roles
- **Product** - Product catalog
- **Order** - Customer orders
- **OrderItem** - Order line items
- **BloodTest** - Blood test orders and results
- **BloodTestResult** - Individual test results

## 🔧 Environment Variables

### Backend (.env)
```env
DATABASE_URL=postgresql://user:password@localhost:5432/vitly_db
JWT_SECRET=your-secret-key
JWT_REFRESH_SECRET=your-refresh-secret-key
JWT_EXPIRES_IN=15m
JWT_REFRESH_EXPIRES_IN=7d
PORT=3001
NODE_ENV=development
FRONTEND_URL=http://localhost:3000
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your-app-password
```

### Frontend (.env.local)
```env
NEXT_PUBLIC_API_URL=http://localhost:3001/api
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_...
DATABASE_URL=postgresql://user:password@localhost:5432/vitly_db
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
```

## 📦 Project Structure

```
vitly/
├── backend/                 # NestJS backend
│   ├── src/
│   │   ├── auth/           # Authentication module
│   │   ├── users/          # User management
│   │   ├── products/       # Product catalog
│   │   ├── orders/         # Order processing
│   │   ├── blood-tests/    # Blood test orders
│   │   ├── ai/             # AI analysis
│   │   └── email/          # Email service
│   ├── prisma/             # Database schema & migrations
│   └── package.json
├── frontend/                # Next.js frontend
│   ├── app/                # Next.js app router pages
│   ├── components/         # React components
│   ├── lib/                # Utilities & API client
│   ├── store/              # Redux store
│   ├── i18n/               # Translations
│   └── package.json
├── docker-compose.yml       # Docker setup
└── README.md
```

## 🧪 Testing

### Backend
```bash
cd backend
npm run test          # Unit tests
npm run test:e2e      # E2E tests
npm run test:cov      # Coverage
```

### Frontend
```bash
cd frontend
npm run lint          # Lint code
```

## 🚢 Production Deployment

1. **Update environment variables** for production
2. **Use production database** (managed PostgreSQL)
3. **Configure Stripe webhooks** with production URLs
4. **Set up SSL certificates**
5. **Configure email service** (production SMTP)
6. **Build and deploy:**
   ```bash
   # Backend
   cd backend
   npm run build
   npm run start:prod
   
   # Frontend
   cd frontend
   npm run build
   npm run start
   ```

## 🐛 Troubleshooting

### Backend won't start
- Check if PostgreSQL is running
- Verify DATABASE_URL in `.env`
- Run `npm run prisma:generate`
- Check if port 3001 is available

### Frontend won't start
- Check if backend is running on port 3001
- Verify NEXT_PUBLIC_API_URL in `.env.local`
- Clear `.next` folder and rebuild
- Check Node.js version (20+)

### Database connection errors
- Verify PostgreSQL is running
- Check DATABASE_URL format
- Ensure database exists
- Run migrations: `npm run prisma:migrate`

### Stripe webhook issues
- Verify webhook secret in `.env`
- Check webhook URL in Stripe dashboard
- Ensure backend is accessible from internet (for production)

## 📝 License

Private - All rights reserved

## 👥 Support

For issues and questions, please contact the development team.

---

**Built with ❤️ for better health**
