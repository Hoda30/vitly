# VITLY Setup Guide

## 🚀 Quick Setup

### Step 1: Install Backend Dependencies

```bash
cd backend
npm install
```

### Step 2: Install Frontend Dependencies

```bash
cd ../frontend
npm install
```

### Step 3: Setup Environment Variables

**Backend:**
```bash
cd ../backend
cp .env.example .env
# Edit .env with your configuration
```

**Frontend:**
```bash
cd ../frontend
cp .env.example .env.local
# Edit .env.local with your configuration
```

### Step 4: Setup Database

```bash
cd ../backend
npm run prisma:generate
npm run prisma:migrate:dev
npm run prisma:seed
```

### Step 5: Start Development Servers

**Terminal 1 - Backend:**
```bash
cd backend
npm run start:dev
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm run dev
```

## ✅ Verification

- Backend: http://localhost:3001/api
- Frontend: http://localhost:3000

## 🔧 Troubleshooting

### If dependencies fail to install:

**Backend:**
```bash
cd backend
rm -rf node_modules package-lock.json
npm install
```

**Frontend:**
```bash
cd frontend
rm -rf node_modules package-lock.json .next
npm install
```

### If TypeScript errors appear:

1. Make sure all dependencies are installed
2. Run `npm run prisma:generate` in backend
3. Restart your IDE/editor

### If ESLint errors appear:

The project uses ESLint 8.x for Next.js compatibility. If you see Babel errors, try:

```bash
cd frontend
npm install --legacy-peer-deps
```


