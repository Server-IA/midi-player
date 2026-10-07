FROM nginx:alpine

COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# URL del backend que consumirá el reproductor (opcional).
# Si se define (por ejemplo desde docker-compose: http://127.0.0.1:5000),
# reemplaza la URL del backend desplegado en Vercel en los scripts.
ARG API_URL=
RUN if [ -n "$API_URL" ]; then \
      sed -i "s#https://composer-music-python-services.vercel.app#${API_URL}#g" \
        /usr/share/nginx/html/js/main.js /usr/share/nginx/html/js/midi.js; \
    fi

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
