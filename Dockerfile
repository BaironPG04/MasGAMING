# Usa la imagen oficial de NGINX
FROM nginx:alpine

# Copia el contenido HTML, CSS, multimedia y JS al directorio de NGINX
COPY ./HTML /usr/share/nginx/html/HTML
COPY ./CSS /usr/share/nginx/html/CSS
COPY ./Multimedia /usr/share/nginx/html/Multimedia
COPY ./script.js /usr/share/nginx/html/script.js

# Copia el index.html a la raíz del servidor (para que se sirva en "/")
RUN rm /usr/share/nginx/html/index.html
COPY ./HTML/index.html /usr/share/nginx/html/index.html

# Expone el puerto 80 (por defecto en NGINX)
EXPOSE 80
