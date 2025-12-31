# How to Run Your Project

## Step 1: Open Terminal/PowerShell

## Step 2: Navigate to Frontend Folder
```powershell
cd C:\Users\Hoda\vitly\frontend
```

## Step 3: Install Dependencies (First Time Only)
```powershell
npm install
```

## Step 4: Start Development Server
```powershell
npm run dev
```

## Step 5: Open Browser
Go to: **http://localhost:3000**

---

## If Port 3000 is Busy:

Use a different port:
```powershell
npm run dev -- -p 3001
```

Then open: **http://localhost:3001**

---

## Quick Test (HTML Version):

If Next.js isn't working, you can test with a simple HTML file:

1. Open `frontend/test-simple.html` in your browser
2. This will show the same design without Next.js

---

## What Should You See?

- Your `vitly-hero-bg.jpg` image as full-screen background
- Large "VITLY" text in white
- Subtitle: "Your journey to better health starts here"
- Two buttons: "Get Started" and "Learn More"
- Smooth animations

---

## Troubleshooting:

**If npm commands don't work:**
- Make sure Node.js is installed: `node --version`
- Make sure you're in the `frontend` folder

**If you see errors:**
- Delete `node_modules` folder
- Delete `package-lock.json`
- Run `npm install` again
- Run `npm run dev`


