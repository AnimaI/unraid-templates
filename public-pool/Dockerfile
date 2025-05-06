# Multi-stage build for a combined Public-Pool image
# Stage 1: Build the UI component
FROM node:lts-slim AS ui-build

WORKDIR /build-ui
# Clone the UI repository
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/AnimaI/public-pool-ui.git .
# Build the UI
RUN npm ci && npm run build

# Stage 2: Build the backend component
FROM node:lts-slim AS backend-build

WORKDIR /build-backend
# Clone the backend repository
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/AnimaI/public-pool.git .
# Build the backend
RUN npm ci && npm run build

RUN ls -la /build-backend/dist/ || echo "FEHLER: /build-backend/dist/ existiert nicht oder ist leer"

# Stage 3: Final image
FROM node:lts-slim

# Install Caddy for the webserver
RUN apt-get update && apt-get install -y curl gnupg \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list \
    && apt-get update && apt-get install -y caddy

# Working directory for the Public-Pool
WORKDIR /app

# Copy the built backend component
COPY --from=backend-build /build-backend/dist /app/
COPY --from=backend-build /build-backend/node_modules /app/node_modules
COPY --from=backend-build /build-backend/package.json /app/

# Create directories for persistent data
RUN mkdir -p /app/data /app/mainnet-DB

# Copy the UI component to the Caddy directory
COPY --from=ui-build /build-ui/dist/public-pool-ui /var/www/html/

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default values for ports
ENV STRATUM_PORT=3333
ENV API_PORT=3334
ENV UI_PORT=8080

# Default values for Bitcoin node
ENV BITCOIN_RPC_URL=http://192.168.1.100
ENV BITCOIN_RPC_PORT=8332
ENV BITCOIN_RPC_USER=rpcuser
ENV BITCOIN_RPC_PASSWORD=rpcpassword
ENV BITCOIN_ZMQ_HOST=tcp://192.168.1.100:28334
ENV BITCOIN_RPC_TIMEOUT=10000
ENV NETWORK=mainnet
ENV API_SECURE=false
ENV POOL_IDENTIFIER=public-pool

# Ports exposed
EXPOSE 3333 3334 8080

# Entrypoint
ENTRYPOINT ["/entrypoint.sh"]
