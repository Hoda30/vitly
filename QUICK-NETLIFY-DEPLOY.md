# Quick Deploy to Netlify - www.vitly.nl

## Fastest Method (Website):

1. **Push to GitHub** (if not already):
   ```powershell
   git init
   git add .
   git commit -m "Ready for Netlify"
   git remote add origin YOUR_GITHUB_REPO
   git push
   ```

2. **Go to Netlify:**
   - Visit [app.netlify.com](https://app.netlify.com)
   - Sign up/Login with GitHub

3. **Deploy:**
   - Click "Add new site" → "Import an existing project"
   - Select your GitHub repository
   - **Build settings:**
     - Base directory: `frontend`
     - Build command: `npm run build`
     - Publish directory: `.next`
   - Click "Deploy site"

4. **Add Domain:**
   - Site settings → Domain management
   - Add custom domain: `www.vitly.nl`
   - Follow DNS instructions

## Or Use CLI:

```powershell
cd C:\Users\Hoda\vitly\frontend
netlify login
netlify init
netlify deploy --prod
```

## DNS Configuration:

At your domain provider, add:

**www.vitly.nl:**
```
Type: CNAME
Name: www
Value: your-site-name.netlify.app
```

**vitly.nl (root):**
```
Type: A
Name: @
Value: 75.2.60.5
```

## Your site will be live at:
`https://www.vitly.nl` (after DNS propagates, 1-24 hours)
