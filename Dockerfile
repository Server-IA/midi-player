FROM nginx:alpine

COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Genera js/config.js al arrancar el contenedor con la URL del backend
# definida en la variable de entorno API_URL (p. ej. desde docker-compose).
COPY docker/40-app-config.sh /docker-entrypoint.d/40-app-config.sh
RUN chmod +x /docker-entrypoint.d/40-app-config.sh

ENV API_URL=https://www.api.inmero.co/composerMusic

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
