# Deploy to www.vitly.nl on Vercel

## Step 1: Deploy to Vercel

### Option A: Via CLI (Fastest)
```powershell
cd C:\Users\Hoda\vitly\frontend
vercel login
vercel
```

When prompted:
- Set up and deploy? **Yes**
- Which scope? **Your account**
- Link to existing project? **No**
- Project name? **vitly**
- Directory? **./**
- Override settings? **No**

Then deploy to production:
```powershell
vercel --prod
```

### Option B: Via Website
1. Push code to GitHub
2. Go to vercel.com
3. Import repository
4. Set Root Directory: `frontend`
5. Deploy

## Step 2: Add Custom Domain

### In Vercel Dashboard:
1. Go to your project settings
2. Click "Domains" in the sidebar
3. Add domain: `www.vitly.nl`
4. Vercel will show DNS records you need to add

### DNS Configuration:
You need to add these DNS records to your domain provider (where you bought vitly.nl):

**Option 1: CNAME (Recommended for www)**
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

**Option 2: A Record (If CNAME not supported)**
```
Type: A
Name: www
Value: 76.76.21.21
```

**For root domain (vitly.nl):**
```
Type: A
Name: @
Value: 76.76.21.21
```

Or use CNAME flattening if your DNS provider supports it.

## Step 3: SSL Certificate
- Vercel automatically provisions SSL certificates
- Wait 1-24 hours for DNS propagation
- Your site will be live at www.vitly.nl

## Important Notes:
- DNS changes can take up to 24-48 hours to propagate
- Vercel will automatically handle HTTPS
- You can add both `vitly.nl` and `www.vitly.nl`
