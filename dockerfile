FROM scratch as static-site
WORKDIR /app
COPY . .
FROM nginx:1.16.0-alpine as server
COPY --from=static-site /app /usr/share/nginx/html
EXPOSE 80
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;"]