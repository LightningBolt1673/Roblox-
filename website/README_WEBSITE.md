# Website for Roblox-

This static website lives in the `website/` folder and provides a simple landing page and usage docs for the project.

How to preview locally

1. From the project root, run a static server from the `website/` directory. Examples:

```bash
python3 -m http.server --directory website 8080
# or
npx http-server website
```

2. Open `http://localhost:8080` in your browser.

Deployment

This repo includes a GitHub Actions workflow (`.github/workflows/deploy-pages.yml`) that will publish `website/` to the `gh-pages` branch. After the workflow runs, enable GitHub Pages in the repository settings (serve from `gh-pages`).
