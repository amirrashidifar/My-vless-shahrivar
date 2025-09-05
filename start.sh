#!/usr/bin/env bash
set -e

PORT="${PORT:-8080}"
UUID="${UUID:?UUID env is required}"
WS_PATH="${WS_PATH:?WS_PATH env is required}"

# جایگذاری متغیرها در قالب کانفیگ
sed -e "s|__PORT__|${PORT}|g" \
    -e "s|__UUID__|${UUID}|g" \
    -e "s|__WS_PATH__|${WS_PATH}|g" \
    /app/config.json.template > /app/config.json

echo "Starting Xray on port ${PORT} with path /${WS_PATH}"
exec /usr/local/xray/xray run -c /app/config.json
