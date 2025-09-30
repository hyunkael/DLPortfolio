# Deep Learning Portfolio

A comprehensive portfolio showcasing my journey through Deep Learning coursework, including laboratory activities, exercises, and projects.

## 📚 About This Portfolio

This Jupyter Book portfolio documents my learning progress in Deep Learning and Artificial Intelligence. It contains:

- **Laboratory Activities**: Hands-on experiments exploring fundamental and advanced deep learning concepts
- **Exercises**: Problem-solving exercises that reinforce theoretical knowledge
- **Projects**: End-to-end projects demonstrating real-world applications
- **Reflections**: Personal insights and learnings throughout the journey

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip package manager
- Git

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/DLPortfolio.git
   cd DLPortfolio
   ```

2. **Create a virtual environment** (recommended):
   ```bash
   python -m venv venv
   
   # On Windows:
   venv\Scripts\activate
   
   # On macOS/Linux:
   source venv/bin/activate
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

### Building the Book

To build the Jupyter Book locally:

```bash
jupyter-book build .
```

The built HTML files will be in the `_build/html` directory. Open `_build/html/index.html` in your browser to view the book.

### Cleaning Build Files

To clean previous builds:

```bash
jupyter-book clean .
```

To clean and remove all build files:

```bash
jupyter-book clean . --all
```

## 📖 Viewing the Portfolio

### Online (GitHub Pages)

Visit the live portfolio at: `https://yourusername.github.io/DLPortfolio/`

### Local Development

After building the book, you can serve it locally:

```bash
# Using Python's built-in server
cd _build/html
python -m http.server 8000
```

Then open `http://localhost:8000` in your browser.

## 🔄 Publishing to GitHub Pages

### Initial Setup

1. **Create a GitHub repository** named `DLPortfolio`

2. **Initialize Git** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Jupyter Book portfolio"
   ```

3. **Add remote and push**:
   ```bash
   git remote add origin https://github.com/yourusername/DLPortfolio.git
   git branch -M main
   git push -u origin main
   ```

### Publishing Updates

Every time you update your portfolio:

1. **Build the book**:
   ```bash
   jupyter-book build .
   ```

2. **Deploy to GitHub Pages**:
   ```bash
   ghp-import -n -p -f _build/html
   ```

   This command:
   - `-n`: Adds a `.nojekyll` file (required for Jupyter Book)
   - `-p`: Pushes to the `gh-pages` branch
   - `-f`: Forces the push (overwrites previous version)

3. **Enable GitHub Pages**:
   - Go to your repository on GitHub
   - Navigate to Settings → Pages
   - Under "Source", select the `gh-pages` branch
   - Click Save

Your portfolio will be live at `https://yourusername.github.io/DLPortfolio/` within a few minutes!

## 📝 Adding New Content

### Adding a New Lab

1. Create a new notebook in the `labs/` directory (e.g., `lab2.ipynb`)
2. Update `_toc.yml` to include the new lab:
   ```yaml
   - file: labs/lab2
     title: Laboratory Task 2 - Your Title
   ```
3. Build and deploy the updated book

### Adding a New Exercise

1. Create a new file in the `exercises/` directory
2. Update `_toc.yml` to include it
3. Build and deploy

### Adding a New Project

1. Create a new file in the `projects/` directory
2. Update `_toc.yml` to include it
3. Build and deploy

## 🎨 Customization

### Updating Personal Information

1. **Edit `_config.yml`**:
   - Update `author` with your name
   - Update `repository.url` with your GitHub repo URL
   - Update `html.baseurl` with your GitHub Pages URL

2. **Edit `intro.md` and `about.md`**:
   - Add your personal information
   - Update contact details
   - Customize the introduction

### Customizing Styles

Edit `_static/custom.css` to modify:
- Colors and themes
- Fonts and typography
- Layout and spacing
- Component styles

### Adding a Logo

1. Add your logo image (e.g., `logo.png`) to the root directory
2. Update `_config.yml`:
   ```yaml
   logo: logo.png
   ```

## 📂 Project Structure

```
DLPortfolio/
├── _config.yml              # Jupyter Book configuration
├── _toc.yml                 # Table of contents
├── intro.md                 # Main landing page
├── about.md                 # About me page
├── reflections.md           # Course reflections
├── requirements.txt         # Python dependencies
├── references.bib           # Bibliography
├── README.md               # This file
├── _static/                # Static assets
│   └── custom.css          # Custom CSS styling
├── labs/                   # Laboratory activities
│   ├── index.md
│   └── lab1.ipynb
├── exercises/              # Practice exercises
│   ├── index.md
│   └── placeholder.md
└── projects/               # Major projects
    ├── index.md
    └── placeholder.md
```

## 🛠️ Technologies Used

- **Jupyter Book**: Static site generator for computational narratives
- **Python**: Primary programming language
- **NumPy & Pandas**: Data manipulation and analysis
- **Matplotlib & Seaborn**: Data visualization
- **GitHub Pages**: Free hosting for the portfolio
- **MyST Markdown**: Enhanced markdown for technical writing

## 📚 Learning Resources

- [Jupyter Book Documentation](https://jupyterbook.org/)
- [Deep Learning Book](https://www.deeplearningbook.org/)
- [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

## 🤝 Contributing

This is a personal learning portfolio, but suggestions and feedback are welcome! Feel free to:
- Open an issue for suggestions
- Submit a pull request for corrections
- Share your own learning journey

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 📧 Contact

- **Name**: Your Name
- **Email**: your.email@example.com
- **GitHub**: [@yourusername](https://github.com/yourusername)
- **LinkedIn**: [Your LinkedIn](https://linkedin.com/in/yourprofile)

---

**Note**: Remember to update all placeholder information (URLs, names, contact details) with your actual information before publishing!

## 🔄 Continuous Updates

This portfolio is continuously updated as I progress through the Deep Learning course. Check back regularly for new content!

**Last Updated**: October 2025
