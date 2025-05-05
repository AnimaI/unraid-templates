#!/bin/bash

# Konfiguration ersetzen
envsubst < /app/.env.tpl > /app/.env
envsubst < /app/ui/proxy.config.prod.json.tpl > /app/ui/proxy.config.prod.json
envsubst < /app/ui/proxy.config.local.json.tpl > /app/ui/proxy.config.local.json
envsubst < /app/ui/src/environments/environment.ts.tpl > /app/ui/src/environments/environment.ts
envsubst < /app/ui/src/environments/environment.prod.ts.tpl > /app/ui/src/environments/environment.prod.ts

# Starten
cd /app
exec npm start
