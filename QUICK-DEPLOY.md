# Quick Deploy to Vercel

## Fastest Way (CLI):

```powershell
cd frontend
npm install -g vercel
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

Then for production:
```powershell
vercel --prod
```

## Or Use Website:

1. Push code to GitHub
2. Go to vercel.com
3. Import repository
4. Set Root Directory to: `frontend`
5. Deploy

## Your site will be live at:
`https://vitly.vercel.app` (or your chosen name)
