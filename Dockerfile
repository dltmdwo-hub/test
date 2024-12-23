
FROM nginx:alpine
COPY src/main/resources/static /usr/share/nginx/html
EXPOSE 80
