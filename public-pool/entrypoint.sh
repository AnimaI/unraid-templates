#!/bin/bash
set -e

# Determine the container's IP address based on network configuration
if [ -z "$EXTERNAL_IP" ]; then
  # If EXTERNAL_IP is not set, try to detect it
  CONTAINER_IP=$(hostname -i)
  if [ "$CONTAINER_IP" = "127.0.0.1" ] || [ -z "$CONTAINER_IP" ]; then
    # If hostname -i returns localhost, try another method
    CONTAINER_IP=$(ip route get 1 | awk '{print $NF;exit}')
  fi
  EXTERNAL_IP=${CONTAINER_IP}
fi

echo "Using external IP: ${EXTERNAL_IP}"

# Configure Caddy for the UI
cat > /etc/Caddyfile << EOF
:${UI_PORT} {
    root * /var/www/html
    file_server
    
    # Redirect API requests to the backend
    handle /api/* {
        reverse_proxy localhost:${API_PORT}
    }
    
    # For SPA routing
    handle_errors {
        @404 {
            expression {http.error.status_code} == 404
        }
        rewrite @404 /index.html
    }
}
EOF

# Configure the UI with the correct backend URLs
sed -i "s|API_URL:.*|API_URL: 'http://${EXTERNAL_IP}:${API_PORT}',|g" /var/www/html/main.*.js
sed -i "s|STRATUM_URL:.*|STRATUM_URL: '${EXTERNAL_IP}:${STRATUM_PORT}'|g" /var/www/html/main.*.js

# Replace all instances of public-pool.io with the EXTERNAL_IP
sed -i "s|https://public-pool.io:40557|http://${EXTERNAL_IP}:${API_PORT}|g" /var/www/html/main.*.js
sed -i "s|http://public-pool.io:40557|http://${EXTERNAL_IP}:${API_PORT}|g" /var/www/html/main.*.js
sed -i "s|//public-pool.io:40557|//${EXTERNAL_IP}:${API_PORT}|g" /var/www/html/main.*.js

# Replace stratum URLs
sed -i "s|stratum+tcp://public-pool.io:21496|stratum+tcp://${EXTERNAL_IP}:${STRATUM_PORT}|g" /var/www/html/main.*.js
sed -i "s|public-pool.io:21496|${EXTERNAL_IP}:${STRATUM_PORT}|g" /var/www/html/main.*.js

# Replace any other references to public-pool.io
sed -i "s|public-pool.io|${EXTERNAL_IP}|g" /var/www/html/main.*.js

echo "Starting Caddy webserver..."
caddy start --config /etc/Caddyfile

echo "Starting Public-Pool backend..."
cd /app
exec node dist/main.js
