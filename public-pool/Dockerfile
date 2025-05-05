# Build backend
FROM node:lts-bookworm as backend

WORKDIR /app

# Klone dein Fork-Repo von public-pool
RUN git clone https://github.com/AnimaI/public-pool.git . && \
    npm install && \
    npm run build

# Kopiere .env.tpl
COPY .env.tpl /app/.env.tpl

# Build frontend
FROM node:lts-bookworm as frontend

WORKDIR /build

# Klone dein Fork-Repo von public-pool-ui
RUN git clone https://github.com/AnimaI/public-pool-ui.git . && \
    npm install && \
    npm run build

# Kopiere tpl-Dateien
COPY proxy.config.local.json.tpl proxy.config.prod.json.tpl /build/
COPY environment.ts.tpl environment.prod.ts.tpl /build/src/environments/

# Final image
FROM node:lts-bookworm

WORKDIR /app

# Backend
COPY --from=backend /app /app

# UI static build
COPY --from=frontend /build/dist/public-pool-ui /app/ui

# TPLs die entrypoint.sh braucht
COPY --from=frontend /build/proxy.config.*.tpl /app/ui/
COPY --from=frontend /build/src/environments/*.tpl /app/ui/src/environments/

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3333 3334 8080

ENTRYPOINT ["/entrypoint.sh"]
