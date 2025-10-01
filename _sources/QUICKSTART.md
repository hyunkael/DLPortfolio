# 🚀 Quick Start Guide

Get your Deep Learning Portfolio up and running in 5 minutes!

## Step 1: Install Dependencies (2 minutes)

```bash
# Navigate to your project directory
cd e:\School\DLPortfolio

# Create and activate virtual environment
python -m venv venv
venv\Scripts\activate

# Install required packages
pip install -r requirements.txt
```

## Step 2: Customize Your Portfolio (2 minutes)

### Update `_config.yml`:
```yaml
author: Your Full Name  # Line 3
repository:
  url: https://github.com/yourusername/DLPortfolio  # Line 19
html:
  baseurl: https://yourusername.github.io/DLPortfolio/  # Line 29
```

### Update `intro.md` and `about.md`:
- Add your name and bio
- Update your learning goals
- Add contact information

## Step 3: Build Your Book (30 seconds)

```bash
jupyter-book build .
```

## Step 4: Preview Locally (30 seconds)

```bash
cd _build/html
python -m http.server 8000
```

Open `http://localhost:8000` in your browser.

## Step 5: Deploy to GitHub Pages (1 minute)

### First Time Setup:
```bash
# Initialize Git
git init
git add .
git commit -m "Initial commit"

# Create GitHub repo at: https://github.com/new
# Name it: DLPortfolio

# Connect and push
git remote add origin https://github.com/yourusername/DLPortfolio.git
git branch -M main
git push -u origin main

# Deploy to GitHub Pages
ghp-import -n -p -f _build/html
```

### Enable GitHub Pages:
1. Go to your repo → Settings → Pages
2. Select `gh-pages` branch
3. Click Save

**Done!** Your portfolio is live at `https://yourusername.github.io/DLPortfolio/`

---

## Future Updates

When you add new content:

```bash
# Option 1: Use the update script
update.bat

# Option 2: Manual commands
jupyter-book clean .
jupyter-book build .
ghp-import -n -p -f _build/html
```

---

## Need Help?

- 📖 See `DEPLOYMENT_GUIDE.md` for detailed instructions
- 📚 See `README.md` for full documentation
- 🐛 Check the Troubleshooting section in `DEPLOYMENT_GUIDE.md`

**Happy Learning! 🎓**
