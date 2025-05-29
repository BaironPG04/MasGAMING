# Usa una imagen ligera con nginx
FROM nginx:alpine

# Borra los archivos por defecto del servidor
RUN rm -rf /usr/share/nginx/html/*

# Copia todos los archivos del proyecto al contenedor
COPY . /usr/share/nginx/html

# Mueve los archivos HTML a la raíz del servidor
RUN mv /usr/share/nginx/html/HTML/* /usr/share/nginx/html/ \
    && rm -rf /usr/share/nginx/html/HTML

# Expone el puerto 80 (para Render o localhost)
EXPOSE 80

# Comando para iniciar Nginx en modo foreground
CMD ["nginx", "-g", "daemon off;"]
