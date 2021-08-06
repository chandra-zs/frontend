FROM       node as step1
RUN        mkdir /app
WORKDIR    /app
COPY       package.json .
RUN        npm install
RUN        npm run build

FROM       nginx
RUN        mkdir -p /var/www/html
COPY       --from=step1 /app/dist /var/www/html
COPY       todo-docker.conf /etc/nginx/conf.d/default.conf
CMD        ["npm","start"]

