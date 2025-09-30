# 📘 Jupyter Book Deployment Guide for GitHub Pages

This comprehensive guide will walk you through deploying your Deep Learning Portfolio to GitHub Pages.

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Initial Setup](#initial-setup)
3. [Building Your Book](#building-your-book)
4. [Publishing to GitHub Pages](#publishing-to-github-pages)
5. [Updating Your Portfolio](#updating-your-portfolio)
6. [Troubleshooting](#troubleshooting)
7. [Advanced Configuration](#advanced-configuration)

---

## Prerequisites

Before you begin, ensure you have:

- ✅ Python 3.8 or higher installed
- ✅ Git installed and configured
- ✅ A GitHub account
- ✅ Basic familiarity with command line/terminal

### Verify Your Setup

```bash
# Check Python version
python --version

# Check Git version
git --version

# Check pip version
pip --version
```

---

## Initial Setup

### Step 1: Install Dependencies

Open your terminal in the `DLPortfolio` directory and run:

```bash
# Create a virtual environment (recommended)
python -m venv venv

# Activate the virtual environment
# On Windows:
venv\Scripts\activate

# On macOS/Linux:
source venv/bin/activate

# Install required packages
pip install -r requirements.txt
```

### Step 2: Update Configuration Files

#### A. Edit `_config.yml`

Open `_config.yml` and update the following fields:

```yaml
# Update these fields with your information
title: Deep Learning Portfolio
author: Your Full Name  # ← Change this

repository:
  url: https://github.com/yourusername/DLPortfolio  # ← Change this
  path_to_book: docs
  branch: main

html:
  baseurl: https://yourusername.github.io/DLPortfolio/  # ← Change this
```

#### B. Edit `intro.md` and `about.md`

- Add your personal information
- Update your bio and background
- Add your contact information

---

## Building Your Book

### Step 1: Clean Previous Builds (if any)

```bash
jupyter-book clean . --all
```

### Step 2: Build the Book

```bash
jupyter-book build .
```

You should see output like:

```
Running Jupyter-Book v0.15.1
Source Folder: /path/to/DLPortfolio
Config Path: /path/to/DLPortfolio/_config.yml
Output Path: /path/to/DLPortfolio/_build/html
...
Finished generating HTML for book.
```

### Step 3: Preview Locally

```bash
# Navigate to the build directory
cd _build/html

# Start a local server
python -m http.server 8000
```

Open your browser and go to `http://localhost:8000` to preview your book.

**Press `Ctrl+C` to stop the server when done.**

---

## Publishing to GitHub Pages

### Method 1: Using ghp-import (Recommended)

This is the easiest method for deploying to GitHub Pages.

#### Step 1: Create a GitHub Repository

1. Go to [GitHub](https://github.com) and log in
2. Click the "+" icon in the top-right corner
3. Select "New repository"
4. Name it `DLPortfolio`
5. Choose "Public" (required for free GitHub Pages)
6. **Do NOT** initialize with README, .gitignore, or license
7. Click "Create repository"

#### Step 2: Initialize Git in Your Project

```bash
# Make sure you're in the DLPortfolio directory
cd e:\School\DLPortfolio

# Initialize Git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Deep Learning Portfolio"

# Rename branch to main (if needed)
git branch -M main

# Add your GitHub repository as remote
git remote add origin https://github.com/yourusername/DLPortfolio.git

# Push to GitHub
git push -u origin main
```

#### Step 3: Build and Deploy

```bash
# Build the book
jupyter-book build .

# Deploy to GitHub Pages
ghp-import -n -p -f _build/html
```

**What this command does:**
- `-n`: Adds a `.nojekyll` file (required for Jupyter Book)
- `-p`: Pushes to GitHub automatically
- `-f`: Forces the push (overwrites previous version)

#### Step 4: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click on "Settings" tab
3. Scroll down to "Pages" in the left sidebar
4. Under "Source", select the `gh-pages` branch
5. Click "Save"

Your portfolio will be live at `https://yourusername.github.io/DLPortfolio/` in 1-2 minutes!

### Method 2: Manual Deployment via GitHub Actions

If you prefer automated deployment, you can use GitHub Actions.

#### Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy Jupyter Book

on:
  push:
    branches:
      - main

jobs:
  deploy-book:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.10'

    - name: Install dependencies
      run: |
        pip install -r requirements.txt

    - name: Build the book
      run: |
        jupyter-book build .

    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./_build/html
```

With this setup, your book will automatically rebuild and deploy whenever you push to the main branch!

---

## Updating Your Portfolio

### Adding New Content

#### 1. Add a New Lab

```bash
# Create a new notebook
# Save it as labs/lab2.ipynb

# Edit _toc.yml and add:
# - file: labs/lab2
#   title: Laboratory Task 2 - Your Title
```

#### 2. Edit Existing Content

Simply edit your markdown or notebook files as needed.

#### 3. Build and Deploy Updates

```bash
# Clean previous build
jupyter-book clean .

# Build the updated book
jupyter-book build .

# Deploy to GitHub Pages
ghp-import -n -p -f _build/html
```

### Quick Update Workflow

Create a script to automate the update process:

**Windows (`update.bat`):**
```batch
@echo off
echo Cleaning previous build...
jupyter-book clean .

echo Building book...
jupyter-book build .

echo Deploying to GitHub Pages...
ghp-import -n -p -f _build/html

echo Done! Your portfolio has been updated.
pause
```

**macOS/Linux (`update.sh`):**
```bash
#!/bin/bash
echo "Cleaning previous build..."
jupyter-book clean .

echo "Building book..."
jupyter-book build .

echo "Deploying to GitHub Pages..."
ghp-import -n -p -f _build/html

echo "Done! Your portfolio has been updated."
```

Make it executable: `chmod +x update.sh`

---

## Troubleshooting

### Issue 1: "jupyter-book: command not found"

**Solution:**
```bash
# Make sure your virtual environment is activated
# Then reinstall:
pip install jupyter-book
```

### Issue 2: Build Errors with Notebooks

**Solution:**
- Check that all code cells in your notebooks run without errors
- Ensure all required libraries are imported
- Set `execute_notebooks: off` in `_config.yml` if you want to skip execution

### Issue 3: GitHub Pages Shows 404

**Solutions:**
1. Wait 2-5 minutes after deployment
2. Check that GitHub Pages is enabled in repository settings
3. Verify the `gh-pages` branch exists
4. Clear your browser cache

### Issue 4: Images Not Displaying

**Solution:**
- Use relative paths for images
- Place images in a dedicated folder (e.g., `images/`)
- Reference them like: `![alt text](../images/myimage.png)`

### Issue 5: CSS Styles Not Applied

**Solution:**
1. Ensure `_static/custom.css` exists
2. Verify `_config.yml` includes:
   ```yaml
   sphinx:
     config:
       html_css_files:
         - custom.css
   ```
3. Rebuild the book completely

### Issue 6: Permission Denied When Pushing

**Solution:**
```bash
# Set up Git credentials
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Use personal access token instead of password
# Generate one at: https://github.com/settings/tokens
```

---

## Advanced Configuration

### Custom Domain

To use a custom domain (e.g., `portfolio.yourdomain.com`):

1. Add a `CNAME` file to your repository root:
   ```
   portfolio.yourdomain.com
   ```

2. Configure DNS with your domain provider:
   - Add a CNAME record pointing to `yourusername.github.io`

3. Enable custom domain in GitHub Pages settings

### Adding Google Analytics

Edit `_config.yml`:

```yaml
sphinx:
  config:
    html_theme_options:
      google_analytics_id: "UA-XXXXXXXXX-X"
```

### Adding Comments (Utterances)

Edit `_config.yml`:

```yaml
sphinx:
  config:
    html_theme_options:
      repository_url: https://github.com/yourusername/DLPortfolio
      repository_branch: main
      use_repository_button: true
      use_issues_button: true
```

### Enabling PDF Export

Install additional dependencies:

```bash
pip install pyppeteer
```

Build PDF:

```bash
jupyter-book build . --builder pdfhtml
```

---

## Best Practices

### 1. Regular Commits

Commit your changes regularly with meaningful messages:

```bash
git add .
git commit -m "Add Lab 2: Neural Networks Basics"
git push origin main
```

### 2. Version Control

Tag important milestones:

```bash
git tag -a v1.0 -m "First semester complete"
git push origin v1.0
```

### 3. Backup Your Work

Always keep your source files backed up:
- Push to GitHub regularly
- Keep local backups
- Consider using cloud storage

### 4. Test Locally First

Always build and preview locally before deploying:

```bash
jupyter-book build .
cd _build/html
python -m http.server 8000
```

### 5. Keep Dependencies Updated

Periodically update your packages:

```bash
pip install --upgrade jupyter-book
pip freeze > requirements.txt
```

---

## Quick Reference Commands

```bash
# Build the book
jupyter-book build .

# Clean build files
jupyter-book clean .

# Clean all build files
jupyter-book clean . --all

# Deploy to GitHub Pages
ghp-import -n -p -f _build/html

# Preview locally
cd _build/html && python -m http.server 8000

# Git workflow
git add .
git commit -m "Your message"
git push origin main
```

---

## Additional Resources

- 📚 [Jupyter Book Documentation](https://jupyterbook.org/)
- 🐙 [GitHub Pages Documentation](https://docs.github.com/en/pages)
- 🎨 [Sphinx Book Theme](https://sphinx-book-theme.readthedocs.io/)
- 💬 [Jupyter Book Community](https://github.com/executablebooks/jupyter-book/discussions)

---

## Need Help?

If you encounter issues:

1. Check the [Jupyter Book FAQ](https://jupyterbook.org/en/stable/faq.html)
2. Search [GitHub Issues](https://github.com/executablebooks/jupyter-book/issues)
3. Ask in the [Community Forum](https://github.com/executablebooks/jupyter-book/discussions)

---

**Happy Publishing! 🚀**

Your Deep Learning Portfolio is now ready to share with the world!
