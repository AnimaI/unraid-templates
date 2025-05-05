#!/bin/bash

set -e

echo "[entrypoint] Substituting templates..."

# Ersetze Platzhalter in allen bekannten tpl-Dateien
envsubst < /app/ui/src/environments/environment.ts.tpl > /app/ui/src/environments/environment.ts
envsubst < /app/ui/src/environments/environment.prod.ts.tpl > /app/ui/src/environments/environment.prod.ts
envsubst < /app/ui/proxy.config.local.json.tpl > /app/ui/proxy.config.local.json
envsubst < /app/ui/proxy.config.prod.json.tpl > /app/ui/proxy.config.prod.json

# Startbefehl (du kannst hier dein Startkommando anpassen)
exec "$@"
