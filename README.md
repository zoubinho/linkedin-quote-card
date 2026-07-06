## Linkedin Quote card generator

A single-page (static HTML) LinkedIn quote card builder. It is served with
nginx inside a Docker container on port **5540**.

### Run from GitHub Container Registry

```bash
docker pull ghcr.io/zoubinho/linkedin-quote-card:main

docker run -d --name linkedin-quote-card --restart unless-stopped -p 5540:5540 \
  ghcr.io/zoubinho/linkedin-quote-card:main
```

Then open http://localhost:5540 in your browser.

### How the image is published

Every push to `main` (and any `v*` tag) triggers the
[`docker-publish`](.github/workflows/docker-publish.yml) GitHub Actions
workflow, which builds the image and pushes it to
`ghcr.io/zoubinho/linkedin-quote-card`. The `main` branch is published as the
`:main` tag.

> The package is private by default. To pull without authentication, set the
> package visibility to **Public** in the repository's *Packages* settings
> (or `docker login ghcr.io` with a token that has `read:packages`).

### Build and run locally

```bash
docker build -t linkedin-quote-card .
docker run -d --name linkedin-quote-card -p 5540:5540 linkedin-quote-card
```
