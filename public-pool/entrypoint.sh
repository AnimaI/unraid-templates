#!/bin/bash

set -e

echo "[entrypoint.sh] Generating .env from environment variables..."

# .env für public-pool backend
cat <<EOF > /app/.env
BITCOIN_RPC_URL=${BITCOIN_RPC_URL}
BITCOIN_RPC_PORT=${BITCOIN_RPC_PORT}
BITCOIN_RPC_USER=${BITCOIN_RPC_USER}
BITCOIN_RPC_PASSWORD=${BITCOIN_RPC_PASSWORD}
BITCOIN_ZMQ_HOST=${BITCOIN_ZMQ_HOST}
BITCOIN_RPC_TIMEOUT=${BITCOIN_RPC_TIMEOUT}
NETWORK=${NETWORK}
STRATUM_PORT=${STRATUM_PORT}
API_PORT=${API_PORT}
UI_PORT=${UI_PORT}
POOL_IDENTIFIER=${POOL_IDENTIFIER}
API_SECURE=${API_SECURE}
EOF

echo "[entrypoint.sh] .env written to /app/.env"
cat /app/.env

echo "[entrypoint.sh] Generating Angular environment files..."

# Angular environment.ts
cat <<EOF > /app/ui/src/environments/environment.ts
export const environment = {
  production: false,
  apiUrl: "http://localhost:${API_PORT}"
};
EOF

# Angular environment.prod.ts
cat <<EOF > /app/ui/src/environments/environment.prod.ts
export const environment = {
  production: true,
  apiUrl: "http://localhost:${API_PORT}"
};
EOF

echo "[entrypoint.sh] Angular environments created."

# Optional: Schreibe Proxy-Konfig
cat <<EOF > /app/ui/proxy.config.local.json
{
  "/api": {
    "target": "http://localhost:${API_PORT}",
    "secure": false
  }
}
EOF

cat <<EOF > /app/ui/proxy.config.prod.json
{
  "/api": {
    "target": "http://localhost:${API_PORT}",
    "secure": false
  }
}
EOF

echo "[entrypoint.sh] Proxy config generated."

echo "[entrypoint.sh] Starting backend and serving frontend..."

# Start backend (hintergrund) & frontend (caddy als Beispiel)
cd /app
npm run start &
cd /app/ui
npx serve -l ${UI_PORT:-8080} dist/public-pool-ui
