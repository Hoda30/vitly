# Deploy to Vercel - Step by Step Guide

## Method 1: Deploy via Vercel Website (Easiest)

### Step 1: Prepare Your Project
1. Make sure your code is committed to Git
2. Push to GitHub, GitLab, or Bitbucket

### Step 2: Deploy
1. Go to [vercel.com](https://vercel.com)
2. Sign up/Login with your GitHub account
3. Click "Add New Project"
4. Import your repository
5. Vercel will auto-detect Next.js
6. Configure:
   - **Framework Preset:** Next.js
   - **Root Directory:** `frontend` (if your Next.js app is in frontend folder)
   - **Build Command:** `npm run build` (or leave default)
   - **Output Directory:** `.next` (or leave default)
7. Click "Deploy"

### Step 3: Wait for Deployment
- Vercel will build and deploy automatically
- You'll get a URL like: `your-project.vercel.app`

## Method 2: Deploy via Vercel CLI

### Step 1: Install Vercel CLI
```powershell
npm install -g vercel
```

### Step 2: Login
```powershell
cd frontend
vercel login
```

### Step 3: Deploy
```powershell
vercel
```

Follow the prompts:
- Set up and deploy? **Yes**
- Which scope? **Your account**
- Link to existing project? **No** (first time)
- Project name? **vitly** (or your choice)
- Directory? **./** (current directory)
- Override settings? **No**

### Step 4: Production Deploy
```powershell
vercel --prod
```

## Important Notes:

1. **Environment Variables:** If you have any `.env` variables, add them in Vercel dashboard:
   - Project Settings → Environment Variables

2. **Build Settings:** Vercel auto-detects Next.js, but verify:
   - Framework: Next.js
   - Build Command: `npm run build`
   - Output Directory: `.next`

3. **Root Directory:** If your Next.js app is in `frontend` folder:
   - Set Root Directory to `frontend` in Vercel settings

4. **Image Path:** Your background image at `/vitly-hero-bg.jpg` should work automatically in Vercel

## Troubleshooting:

- **Build fails?** Check build logs in Vercel dashboard
- **Images not loading?** Make sure `public/vitly-hero-bg.jpg` exists
- **Buttons not working?** Check browser console on deployed site

## After Deployment:

Your site will be live at: `https://your-project.vercel.app`

You can also set up a custom domain in Vercel dashboard.
