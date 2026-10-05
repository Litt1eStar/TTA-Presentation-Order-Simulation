# Hosted build: the single-file page served by nginx. HTTPS is handled by the shared Caddy on the droplet.
FROM nginx:stable-alpine
LABEL org.opencontainers.image.source="https://github.com/Litt1eStar/TTA-Presentation-Order-Simulation"
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ["TTA Order Portal.html", "/usr/share/nginx/html/index.html"]
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1/healthz || exit 1
CMD ["nginx", "-g", "daemon off;"]
