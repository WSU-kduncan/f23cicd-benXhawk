FROM nginx:1.10.1-alpine
COPY websites/index.html usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
