FROM       node
RUN        apt-get install nginx -y
RUN        mkdir -p /var/www/html
RUN        mkdir /app
WORKDIR    /app
COPY       server.js .
COPY       package.json .
RUN        npm install
RUN        npm run build
COPY       dist /var/www/html
COPY       todo-docker.conf /etc/nginx/conf.d/default.conf
CMD        ["npm","start"]

