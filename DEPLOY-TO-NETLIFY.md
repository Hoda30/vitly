# Deploy to Netlify - www.vitly.nl

## Step 1: Install Netlify CLI (Optional but Recommended)

```powershell
npm install -g netlify-cli
```

## Step 2: Deploy to Netlify

### Option A: Via Netlify Website (Easiest)

1. **Push your code to GitHub:**
   ```powershell
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin YOUR_GITHUB_REPO_URL
   git push -u origin main
   ```

2. **Go to Netlify:**
   - Visit [netlify.com](https://netlify.com)
   - Sign up/Login with GitHub

3. **Add New Site:**
   - Click "Add new site" → "Import an existing project"
   - Connect to GitHub
   - Select your repository

4. **Configure Build Settings:**
   - **Base directory:** `frontend`
   - **Build command:** `npm run build`
   - **Publish directory:** `.next`
   - **Framework preset:** Next.js (auto-detected)

5. **Deploy:**
   - Click "Deploy site"
   - Wait for build to complete

### Option B: Via Netlify CLI

```powershell
cd C:\Users\Hoda\vitly\frontend
netlify login
netlify init
netlify deploy --prod
```

When prompted:
- Create & configure a new site? **Yes**
- Team: **Your team**
- Site name: **vitly** (or your choice)
- Build command: **npm run build**
- Directory to deploy: **.next**

## Step 3: Add Custom Domain (www.vitly.nl)

### In Netlify Dashboard:

1. Go to your site
2. Click **Site settings** → **Domain management**
3. Click **Add custom domain**
4. Enter: `www.vitly.nl`
5. Netlify will show DNS records

### Configure DNS Records:

In your domain provider (where you manage vitly.nl):

**For www.vitly.nl:**
```
Type: CNAME
Name: www
Value: your-site-name.netlify.app
```

**For root domain (vitly.nl):**
```
Type: A
Name: @
Value: 75.2.60.5
```

Or use Netlify's DNS if you want:
- Go to Netlify DNS
- Add your domain
- Update nameservers at your domain registrar

## Step 4: SSL Certificate

- Netlify automatically provides SSL certificates
- Wait for DNS propagation (1-24 hours)
- Your site will be live at www.vitly.nl with HTTPS

## Important Notes:

- Make sure `netlify.toml` is in the `frontend` folder
- Netlify auto-detects Next.js but verify build settings
- DNS changes can take up to 48 hours to propagate
- You can add both `vitly.nl` and `www.vitly.nl`

## Troubleshooting:

- **Build fails?** Check build logs in Netlify dashboard
- **Domain not working?** Verify DNS records are correct
- **Images not loading?** Check that `public/vitly-hero-bg.jpg` exists
