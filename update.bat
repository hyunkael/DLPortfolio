@echo off
echo ========================================
echo  Deep Learning Portfolio - Update Script
echo ========================================
echo.

echo [1/3] Cleaning previous build...
jupyter-book clean .
echo.

echo [2/3] Building book...
jupyter-book build .
echo.

echo [3/3] Deploying to GitHub Pages...
ghp-import -n -p -f _build/html
echo.

echo ========================================
echo  Update Complete!
echo ========================================
echo Your portfolio has been updated and deployed.
echo Visit: https://hyunkael.github.io/Deep-Learning-Portfolio/
echo.
pause
