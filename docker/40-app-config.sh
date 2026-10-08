#!/bin/sh
# Genera js/config.js con la URL del backend tomada de la variable de entorno API_URL.
set -e

: "${API_URL:?La variable de entorno API_URL es obligatoria}"

cat > /usr/share/nginx/html/js/config.js <<CONFIG
window.APP_CONFIG = {
    API_URL: '${API_URL%/}'
};
CONFIG
