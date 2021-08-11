FROM       node:10-alpine as builder
RUN        mkdir /app
COPY       package.json .
RUN        npm install
WORKDIR    /app
COPY       . .
RUN        npm run build

FROM      nginx:1.16.0-alpine
RUN       mkdir -p /var/www/html
COPY      --from=builder /app/build /var/www/html
COPY      . /var/www/html
COPY      todo-docker.conf /etc/nginx/conf.d/default.conf
CMD       ["nginx", "-g", "daemon off;"]

