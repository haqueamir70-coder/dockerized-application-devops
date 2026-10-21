# Unprivileged Nginx listens on 8080 and runs without root privileges.
FROM nginxinc/nginx-unprivileged:1.27-alpine

COPY --chown=nginx:nginx app/ /usr/share/nginx/html/

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
