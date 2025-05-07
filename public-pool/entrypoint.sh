#!/bin/bash
set -e

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
sed -i "s|API_URL:.*|API_URL: 'http://localhost:${API_PORT}',|g" /var/www/html/main.*.js
sed -i "s|STRATUM_URL:.*|STRATUM_URL: 'localhost:${STRATUM_PORT}'|g" /var/www/html/main.*.js

# Replace the hardcoded public-pool.io URL
#sed -i "s|https://public-pool.io:40557|http://localhost:${API_PORT}|g" /var/www/html/main.*.js
sed -i "s|https://public-pool.io:40557|http://${EXTERNAL_IP}:${API_PORT}|g" /var/www/html/main.*.js

echo "Starting Caddy webserver..."
caddy start --config /etc/Caddyfile

echo "Starting Public-Pool backend..."
cd /app
exec node dist/main.js
