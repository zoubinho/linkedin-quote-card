# Serve the static LinkedIn Quote Card builder with nginx.
FROM nginx:1.27-alpine

# nginx config that listens on 5540 instead of the default 80.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# The app is a single static HTML file, served as the site index.
COPY linkedin_quote_card.html /usr/share/nginx/html/index.html

EXPOSE 5540

# Basic healthcheck so orchestrators can see the container is serving.
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:5540/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
