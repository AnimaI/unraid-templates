# --------------------------------------------
# Build backend
# --------------------------------------------
FROM node:lts-bookworm AS backend

WORKDIR /app

# Clone your forked public-pool repository
RUN git clone https://github.com/AnimaI/public-pool.git . && \
    npm install && \
    npm run build

# Copy .env.tpl
COPY .env.tpl /app/.env.tpl

# --------------------------------------------
# Build frontend
# --------------------------------------------
FROM node:lts-bookworm AS frontend

WORKDIR /build

# Clone your forked public-pool-ui repository
RUN git clone https://github.com/AnimaI/public-pool-ui.git . && \
    npm install && \
    npm run build

# Copy template files
COPY proxy.config.local.json.tpl proxy.config.prod.json.tpl /build/
COPY environment.ts.tpl environment.prod.ts.tpl /build/src/environments/

# --------------------------------------------
# Final runtime image
# --------------------------------------------
FROM node:lts-bookworm AS final

WORKDIR /app

# Copy backend and frontend output
COPY --from=backend /app /app
COPY --from=frontend /build/dist/public-pool-ui /app/ui
COPY --from=frontend /build/proxy.config.*.tpl /app/ui/
COPY --from=frontend /build/src/environments/*.tpl /app/ui/src/environments/
COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*
RUN chmod +x /entrypoint.sh

EXPOSE 3333 3334 8080

ENTRYPOINT ["/entrypoint.sh"]
